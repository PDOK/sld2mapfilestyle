import os
import sys
import lxml.etree as ET
import click
import sld2mapfilestyle.stringbuilder as stringbuilder

def get_sld_version(xml_filename):
    dom = ET.parse(xml_filename)
    sld_version = dom.xpath('/sld:StyledLayerDescriptor/@version', \
        namespaces={"sld": "http://www.opengis.net/sld"})[0]
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
    classes_list.append(result)
    for style_class in classes_list:
        string_builder.append(style_class)
    return str(string_builder)

def get_symbol_string(sld_file):
    my_stringbuilder = stringbuilder.StringBuilder()
    named_styles = execute_xslt('sld2namedStyles', os.path.join(sld_file))
    if named_styles:
        my_stringbuilder.append(named_styles.strip('\n'))
    return str(my_stringbuilder)

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
