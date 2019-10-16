# Mapserver SLD Converter

Met dit project kan een set SLD-bestanden worden omgezet naar een Mapserver-configuratie, maar enkel de style informatie. 

* Python 3.6
* lxml


## Install with pip3

Uitvoeren in root van project directory:

```
pip3 install .
```
Dan uitvoeren:

```
convert-sld <path-to-sld> <destination-dir>
```

## Debug in VS Code

Add this launch configuration to `.vscode/launch.json`:

```
 {
    "name": "convert-sld-command",
    "type": "python",
    "request": "launch",
    "module": "sld2mapfilestyle.sld2mapfilestyle",
    "args": [
        "convert-sld",
        "tests/sld/cbs_inwoners/cbs_pc4_aantal_inwoners.sld",
        "data/"
    ]
}
```