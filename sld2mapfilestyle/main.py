import os
import argparse
import lxml.etree as ET

def _get_sld_version(xml_filename):
    dom = ET.parse(xml_filename)
    sld_version = dom.xpath('/sld:StyledLayerDescriptor/@version', \
        namespaces={"sld": "http://www.opengis.net/sld"})[0]
    return sld_version

def _get_xslt_filename(xslt_type, sld_version):
    if sld_version == "1.1.0":
        xslt_filename = "{0}_1.1.xslt".format(xslt_type)
    elif sld_version == "1.0.0":
        xslt_filename = "{0}_1.0.xslt".format(xslt_type)
    return xslt_filename

def _execute_xslt(xslt_type, sld_filename):
    dom = ET.parse(sld_filename)
    sld_version = _get_sld_version(sld_filename)
    xslt_filename = _get_xslt_filename(xslt_type, sld_version)
    xsl_path = os.path.join(os.path.dirname(__file__), "xslt", xslt_filename)
    xslt = ET.parse(xsl_path)
    transform = ET.XSLT(xslt)
    try:
        newdom = transform(dom)
    except Exception as e:
        if transform.error_log:
            message = f"Error occured while applying xsl tranformation file \
                {xsl_path} on {sld_filename}"
            for error in transform.error_log:
                message += error.message, error.line
            raise Exception(message)
        else:
            raise e
    return str(newdom)

def get_style_string(sld_file):
    style_string = _execute_xslt('style', os.path.join(sld_file))
    return style_string

def get_symbol_string(sld_file):
    symbol_string = _execute_xslt('symbol', os.path.join(sld_file))
    return symbol_string

def _get_output_filepath(sld_file, output_dir, ext):
    basenamepath = os.path.splitext(sld_file)[0]
    basename = os.path.basename(basenamepath)
    filepath = os.path.join(output_dir, "{0}{1}".format(basename, ext))
    return filepath

def _convert_sld_cli(sld_file, output_dir, silent=True):
    try:
        style_string = get_style_string(sld_file)
        symbol_string = get_symbol_string(sld_file)
    except Exception as e:
        if not silent:
            print("error occured during transforming sld: " + str(e))
        exit(1)
    if style_string:
        style_path = _get_output_filepath(sld_file, output_dir, ".style")
        output = os.path.abspath(style_path)
        with open(output, 'w+') as file:
            file.write(style_string)
            if not silent:
                print("style saved in {0}".format(output))
    if symbol_string:
        outputdir = os.path.dirname(os.path.abspath(output))
        symbol_file = os.path.splitext(os.path.basename(output))[0]
        symbol_file = os.path.join(outputdir, "{0}.symbol".format(symbol_file))
        with open(symbol_file, 'w+') as file:
            file.write(symbol_string)
            if not silent:
                print("symbol saved in {0}".format(symbol_file))

def _cli():
    parser = argparse.ArgumentParser()
    parser.add_argument("sld_file", help="path to sld file to convert")
    parser.add_argument("output_dir", help="directory to save output files")
    parser.add_argument("--silent", help="do not print output to stdout")
    args = parser.parse_args()
    silent = args.silent
    sld_file = args.sld_file
    output_dir = args.output_dir
    _convert_sld_cli(sld_file, output_dir, silent)
