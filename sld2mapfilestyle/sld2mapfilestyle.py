import os
import re
import subprocess
import sys
import lxml.etree as ET
import argparse
import io
import click

if __package__ is None or __package__ == '':
#uses current directory visibility
  import stringbuilder
else:
#uses current package visibility
  from . import stringbuilder

def get_minmax_scale_denoms(classesList):
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

def get_class_item(classes):
    for line in classes.split('\n'):
        if line.strip().startswith('CLASSITEM '):
            return line.strip().split()[1]
    return None

def get_style_name(xml_filename):
    sld_version = get_sld_version(xml_filename)
    dom = ET.parse(xml_filename)
    if sld_version == "1.1.0":
        style_name = dom.xpath('/sld:StyledLayerDescriptor/sld:NamedLayer/sld:UserStyle/se:Name/text()', namespaces={"sld": "http://www.opengis.net/sld", "se":"http://www.opengis.net/se"})[0]
    else:
        style_name = dom.xpath('/sld:StyledLayerDescriptor/sld:NamedLayer/sld:UserStyle/sld:Name/text()', namespaces={"sld": "http://www.opengis.net/sld", "se":"http://www.opengis.net/se"})[0]
    return style_name

def get_sld_version(xml_filename):
    dom = ET.parse(xml_filename)
    sld_version = dom.xpath('/sld:StyledLayerDescriptor/@version', namespaces={"sld": "http://www.opengis.net/sld"})[0]
    return sld_version

def execute_xslt(xsl_filename, xml_filename):
    dom = ET.parse(xml_filename)
    sld_version = get_sld_version(xml_filename)
    if sld_version == "1.1.0":
        xsl_filename = "{0}_1.1.xslt".format(xsl_filename)
    elif sld_version == "1.0.0":
        xsl_filename = "{0}_1.0.xslt".format(xsl_filename)
    xsl_path = os.path.join(os.path.dirname(__file__),"xslt", xsl_filename)
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


def get_style_string(sld_file):
    string_builder = stringbuilder.StringBuilder()
    classes_list = []
    result = execute_xslt('sld2map', os.path.join(sld_file))
    print(result)
    classes_list.append(result)

    # scale_denoms = get_minmax_scale_denoms(classes_list)
    # Required to set scaledenom min max at layer level? Or can we set it at the class/style level as wel?
    # if 'min' in scaleDenoms and scaleDenoms['min'] is not None:
    #     print('    MINSCALEDENOM {:f}'.format(scaleDenoms['min'])) 
    # if 'max' in scaleDenoms and scaleDenoms['max'] is not None:
    #     print('    MAXSCALEDENOM {:f}'.format(scaleDenoms['max'])) 
    # print('')
    style_name = get_style_name(sld_file)
    string_builder.append('    CLASSGROUP "{0}"'.format(style_name))
    for c in classes_list:
        string_builder.append(c.replace('{group-placeholder}', style_name))
    return str(string_builder)

def get_symbol_string(sld_file):
    sb = stringbuilder.StringBuilder()
    namedStyles = execute_xslt('sld2namedStyles', os.path.join(sld_file))
    if len(namedStyles) > 0:
        sb.append(namedStyles.strip('\n'))
    return str(sb)

def get_output_filepath(sld_file, output_dir, ext):
    basenamepath = os.path.splitext(sld_file)[0]
    basename = os.path.basename(basenamepath)
    filepath = os.path.join(output_dir, "{0}{1}".format(basename, ext))
    return filepath


def convert_sld(sld_file, output_dir="", silent=True):
    if not os.path.exists(sld_file):
        print("SLD file does not exist!", file=sys.stderr)
        exit(1)
    style_string = get_style_string(sld_file)
    result = []
    if style_string:
        if not output_dir:
            print("### STYLE")
            print(style_string)
        else:
            style_path = get_output_filepath(sld_file, output_dir, ".style")
            output = os.path.abspath(style_path)
            with open(output, 'w+') as file:
                file.write(style_string)
                if not silent: print("style saved in {0}".format(output))
            result.append(output)
    symbol_string = get_symbol_string(sld_file)
    if symbol_string:
        if not output:
            print("### SYMBOLS")
            print(symbol_string)
        else:
            outputdir = os.path.dirname(os.path.abspath(output))
            symbol_file = os.path.splitext(os.path.basename(output))[0]
            symbol_file = os.path.join(outputdir, "{0}.symbol".format(symbol_file))
            with open(symbol_file, 'w+') as file:
                file.write(symbol_string)
                if not silent: print("symbol saved in {0}".format(symbol_file))
            result.append(symbol_file)
    return result

@click.group()
def cli():
    pass

@cli.command(name="convert-sld")
@click.argument('sld_file', type=click.Path(exists=True))
@click.argument('output_dir', type=click.Path(exists=False))
@click.option('--silent/--verbose', default=False)
def convert_sld_command(sld_file, output_dir="", silent=True):
    return convert_sld(sld_file, output_dir, silent)

if __name__ == "__main__":
    # pylint: disable=no-value-for-parameter
    cli()
