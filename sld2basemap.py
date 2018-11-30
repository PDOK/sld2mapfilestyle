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
            minsd = DEFAULT_MINSD
            maxsd = DEFAULT_MAXSD
            if line.strip() == 'STYLE' or line.strip() == 'LABEL':
                inStyle = True
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
    sld_version = dom.xpath('/sld:StyledLayerDescriptor/@version', namespaces={"sld": "http://www.opengis.net/sld"})[0]
    if sld_version == "1.1.0":
        xsl_filename = "{0}_1.1.xslt".format(xsl_filename)
    elif sld_version == "1.0.0":
        xsl_filename = "{0}_1.0.xslt".format(xsl_filename)
    xsl_path = os.path.join("xslt", xsl_filename)
    xslt = ET.parse(xsl_path)
    transform = ET.XSLT(xslt)
    try:
        newdom = transform(dom)    
    except:
        print("Error occured while applying xsl tranformation {0} on file {1}".format(xsl_filename, xml_filename))
        for error in transform.error_log:
            print(error.message, error.line)
        exit(1)
    return str(newdom)


if __name__ == "__main__":
    if len(sys.argv) < 3:
        print("Syntax: {0} <CSV-file> <SLD-dir> [<Title>]".format(sys.argv[0]))
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
        
    print('MAP')
    print('  NAME          "{0}"'.format(baseName)) 
    print('  INCLUDE       "header.inc"')
    print("")
    print('  WEB')
    print('    METADATA')
    print('      "ows_title"               "{0}"'.format(serviceTitle)) 
    print('      "ows_abstract"            "{0}"'.format(serviceTitle)) 
    print('      "ows_keywordlist"         "PDOK Geopackage Mapserver {0}"'.format(serviceTitle))
    print('      # The disadvantage of setting an onlineresource URL is that the servername is fixed. It can\')t')
    print('      # be changed through an environment variable, or by modifying the Apache config.')
    print('      #"ows_onlineresource"      "http://localhost/maps/example?"')
    print('      "wfs_namespace_prefix"    "{0}"'.format(baseName))
    print('      "wfs_namespace_uri"       "http://example.org/pdok/{0}"'.format(baseName))
    print('    END')
    print('  END')
    print('')
        
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
                    result = executeXslt('sld2map',  os.path.join(sldDir, "{0}.sld".format(style)))
                    classesList.append(result)
            except subprocess.CalledProcessError as e:
                print("Ping stdout output:\n", e.output)
                exit(1)
                
            scaleDenoms = getMinMaxScaleDenoms(classesList)
            
            print( '  LAYER')
            print( '    NAME "{0}"'.format(layer))
            print( '    STATUS ON')
            
            if geomtype == 'line' or 'lijn' in layer.lower():
                print( '    TYPE LINE')
            elif geomtype == 'area' or 'vlak' in layer.lower():
                print( '    TYPE POLYGON')
            else:
                print ('    TYPE POINT')
                
            # TODO: allow custom extent?
            print( '    EXTENT 10000 300000 280000 625000')
            print("")
            
            print('    METADATA')
            print('      "ows_title"               "{0}"'.format(layer))
            print('      "wms_include_items"       "all"')
            print('      "gml_include_items"       "all"')
            print('      "gml_featureid"           "gid"')
            print('      "gml_geometries"          "geom"')
            print('      "ows_metadataurl_type"    "TC211"')
            print('      "ows_metadataurl_format"  "text/plain"')
            print('      "ows_metadataurl_href"    "http://nationaalgeoregister.nl/geonetwork/srv/dut/xml.metadata.get?uuid=123"')
            print('      "ows_group_title"         "{0}"'.format(baseName))
            print('    END')
            print('')
            print('    CONNECTIONTYPE OGR')
            print('    CONNECTION "/srv/data/{0}"'.format(geopackage))
            
            # TODO: misschien altijd alles nodig i.g.v. GetFeatureInfo / WFS.
            # Splitsing services voor visualisatie en bevragen mogelijk?
            if len(classesList) > 0 or 'LABEL' in classesList[0]:
                # Alle velden nodig, het te querien veld moet nog uit 'classes' worden geparsed.
                # Bij meerdere stijlen is vooralsnog teveel werk om de benodigde velden te parsen.
                print('    DATA "select * from {0}"'.format(layer))
            else:
                classitem = getClassitem(classesList[0])
                if classitem is not None:
                    print('    DATA "select geom, {0} from {1}"'.format(classitem, layer))
                else:
                    print('    DATA "select geom from {0}"'.format(layer)) 
            print('    PROCESSING "CLOSE_CONNECTION=DEFER"')
            
            if 'min' in scaleDenoms and scaleDenoms['min'] is not None:
                print('    MINSCALEDENOM {:f}'.format(scaleDenoms['min'])) 
            if 'max' in scaleDenoms and scaleDenoms['max'] is not None:
                print('    MAXSCALEDENOM {:f}'.format(scaleDenoms['max'])) 
            print('    TEMPLATE "dummy"')
            print('')
            
            if False:
                # Basisstijl
                print('    CLASS')
                print('      STYLE')
                if 'lijn' in layer.lower():
                    print('        COLOR "#000000"')
                elif 'vlak' in layer.lower():
                    print('        COLOR "#808080"')
                    print('        OUTLINECOLOR "#000000"')
                else:
                    print('        COLOR "#000000"')
                print('')
                print('      END')
                print('    END')
            else:
                # Vanuit SLD omgezette stijlen
                print('    CLASSGROUP "{0}"'.format(styleList[0]))

                for i in range(0, len(styleList)):
                    print(classesList[i].replace('{group-placeholder}', styleList[i]))
            
            print('  END # LAYER')
            print('')
            
            for style in styleList:
                namedStyles = executeXslt('sld2namedStyles', os.path.join(sldDir, "{0}.sld".format(style)))
                
                if len(namedStyles) > 0:
                    print(namedStyles.strip('\n'))
                    print('')
                
    print('END # MAP')
