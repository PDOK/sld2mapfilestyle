# sld2mapfilestyle

A commandline tool to convert Styled Layer Descriptor (SLD) files to MapServer Mapfile style definitions.

## SLD support

At this time sld2mapfilestyle does not support the full SLD specification. Both SLD 1.0.0 and 1.1.0 are suppported, although support for version 1.1.0 is not as extented as version 1.0.0. Not all filters that are supported in 1.0.0 are supported in 1.1.0.

## Requirements

- Python >=3.6
- lxml

## Installation

Clone this repository and execute on the commandline (replace `<path to sld2mapfilestyle>` with the actual path to the project root):

```
pip3 install <path to sld2mapfilestyle>
```

## Usage

Use the cli tool by invoking `sld2mapfilestyle` on the command line:

```
sld2mapfilestyle --help
usage: sld2mapfilestyle [-h] [--silent SILENT] sld_file output_dir

positional arguments:
  sld_file         path to sld file to convert
  output_dir       directory to save output files

optional arguments:
  -h, --help       show this help message and exit
  --silent SILENT  do not print output to stdout
```

Running `sld2mapfilestyle` will generate a `<name>.style` file and `<name>.symbol` file (if the style contains a markersymbol). These files can be included in MapServer Mapfile using `INCLUDE` like so:

```
INCLUDE  <name>.style
```

## Development

### Setup debugger VS Code

Add this launch configuration to `.vscode/launch.json`:

```json
{
    "name": "sld2mapfilestyle",
    "type": "python",
    "request": "launch",
    "module": "sld2mapfilestyle.main",
    "args": [
        "sld/some-sld.sld",
        "data/"
    ]
}
```

### Unittests

Run unit tests with:

```bash
python3 -m unittest discover ./test "test_*.py"
```

## Contributors

- [arbakker](https://github.com/arbakker)
- [fsteggink](https://github.com/fsteggink)
