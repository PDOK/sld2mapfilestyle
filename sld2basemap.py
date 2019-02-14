import os
import re
import subprocess
import sys

import lxml.etree as ET


def getMinMaxScaleDenoms(classesList):

	DEFAULT_MINSD = 1e12
	DEFAULT_MAXSD = 0
	result = {}
	
	for classes in classesList:
		for line in classes.split('\n'):
			if line.strip() == 'STYLE' or line.strip() == 'LABEL':
				inStyle = True
				minsd = DEFAULT_MINSD
				maxsd = DEFAULT_MAXSD
			if line.strip() == 'END':
				inStyle = False
				
				if 'min' in result:
					if minsd < result['min']:
						result['min'] = minsd
					elif minsd == DEFAULT_MINSD:
						result['min'] = DEFAULT_MAXSD
				else:
					result['min'] = minsd
					
				if 'max' in result:
					if maxsd > result['max']:
						result['max'] = maxsd
					elif maxsd == DEFAULT_MAXSD:
						result['max'] = DEFAULT_MINSD
				else:
					result['max'] = maxsd
				
			if 'MINSCALEDENOM' in line:
				msd = float(line.strip().split()[-1])
				if msd < minsd:
					minsd = msd
					
			if 'MAXSCALEDENOM' in line:
				msd = float(line.strip().split()[-1])
				if msd > maxsd:
					maxsd = msd
				
	return result
	

def getClassitem(classes):

	for line in classes.split('\n'):
		if line.strip().startswith('CLASSITEM '):
			return line.strip().split()[1]
			
	return None
	
	
def executeXslt(xsl_filename, xml_filename):
	dom = ET.parse(xml_filename)
	xslt = ET.parse(xsl_filename)
	transform = ET.XSLT(xslt)
	newdom = transform(dom)
	return str(newdom)


if __name__ == "__main__":
	if len(sys.argv) < 3:
		print("Syntax: %s <CSV-file> <SLD-dir> [<Title>]" % sys.argv[0])
		exit(1)
		
	csvFile = sys.argv[1]
	sldDir = sys.argv[2]
	
	baseName = os.path.splitext(os.path.basename(csvFile))[0];
	serviceTitle = sys.argv[3] if len(sys.argv) > 3 else baseName
		
	if not os.path.isdir(sldDir):
		print("SLD dir does not exist!")
		exit(1)
		
	if not os.path.exists(csvFile):
		print("CSV file does not exist!")
		exit(1)
		
	with open(csvFile, 'r') as f:
	
		for line in f:
			line = re.sub('\#.*', '', line).strip()
			if len(line) == 0:
				continue
				
			items = line.split(',')
			if len(items) < 3:
				continue
				
			geopackage = items[0]
			layer = items[1]
			styles = items[2]
			geomtype = items[3] if len(items) >= 4 else ''
			
			classesList = []
			styleList = styles.split()
			try:
				for style in styleList:
					result = executeXslt('sld2map.xslt', '%s/%s.sld' % (sldDir, style))
					classesList.append(result)
			except subprocess.CalledProcessError as e:
				print("Ping stdout output:\n", e.output)
				exit(1)
				
			scaleDenoms = getMinMaxScaleDenoms(classesList)
			
			print('LAYER')
			print('  NAME "%s"' % layer)
			print('  STATUS ON')
			print('  LABELCACHE ON')

			if geomtype == 'line' or 'lijn' in layer.lower():
				print('  TYPE LINE')
			elif geomtype == 'area' or 'vlak' in layer.lower():
				print('  TYPE POLYGON')
			elif geomtype == 'label' in layer.lower():
				print('  TYPE POINT')
			else:
				print('  TYPE POINT')
				
			# TODO: allow custom extent?
			print('  EXTENT 0 200000 280000 725000')
			print('')
			
			print('  METADATA')
			print('    "ows_title"               "%s"' % layer)
			print('    "wms_include_items"       "sld_all"')
			print('    "gml_include_items"       "sld_all"')
			print('    "gml_featureid"           "gid"')
			print('    "gml_geometries"          "geom"')
			print('    "ows_metadataurl_type"    "TC211"')
			print('    "ows_metadataurl_format"  "text/plain"')
			print('    "ows_metadataurl_href"    "http://nationaalgeoregister.nl/geonetwork/srv/dut/xml.metadata.get?uuid=123"')
			print('    "ows_group_title"         "%s"' % baseName)
			print('  END')
			print('')
			print('  CONNECTIONTYPE OGR')
			print('  CONNECTION "/srv/data/%s"' % geopackage)
			
			# TODO: misschien altijd alles nodig i.g.v. GetFeatureInfo / WFS.
			# Splitsing services voor visualisatie en bevragen mogelijk?
			if len(classesList) > 0 or 'LABEL' in classesList[0]:
				# Alle velden nodig, het te querien veld moet nog uit 'classes' worden geparsed.
				# Bij meerdere stijlen is vooralsnog teveel werk om de benodigde velden te parsen.
				print('  DATA "select * from %s"' % layer)
			else:
				classitem = getClassitem(classesList[0])
				if classitem is not None:
					print('  DATA "select geom, %s from %s"' % (classitem, layer))
				else:
					print('  DATA "select geom from %s"' % layer)
			print('  PROCESSING "CLOSE_CONNECTION=DEFER"')
			
			if 'min' in scaleDenoms and scaleDenoms['min'] is not None:
				print('  MINSCALEDENOM %.f' % scaleDenoms['min'])
			if 'max' in scaleDenoms and scaleDenoms['max'] is not None:
				print('  MAXSCALEDENOM %.f' % scaleDenoms['max'])
			print('  TEMPLATE "dummy"')
			print('')
			
			if False:
				# Basisstijl
				print('  CLASS')
				print('    STYLE')
				if 'lijn' in layer.lower():
					print('      COLOR "#000000"')
				elif 'vlak' in layer.lower():
					print('      COLOR "#808080"')
					print('      OUTLINECOLOR "#000000"')
				else:
					print('      COLOR "#000000"')
				print('')

				print('    END')
				print('  END')
			else:
				# Vanuit SLD omgezette stijlen
				print('  CLASSGROUP "%s"' % styleList[0])

				for i in range(0, len(styleList)):
					print(classesList[i].replace('{group-placeholder}', styleList[i]))
			
			print('END # LAYER')
			print('')
			
			for style in styleList:
				namedStyles = executeXslt('sld2namedStyles.xslt', '%s/%s.sld' % (sldDir, style))
				
				if len(namedStyles) > 0:
					print(namedStyles.strip('\n'))
					print('')
				
	#print('END # MAP'
