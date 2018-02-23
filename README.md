# Mapserver SLD Converter

Met dit project kan een set SLD-bestanden worden omgezet naar een Mapserver-configuratie. Mapserver ondersteunt wel SLD's, maar alleen als onderdeel van de WMS-standaard, waarbij een SLD-bestand meegegeven kan worden aan een GetMap-request. Voor het direct configureren ben je nog steeds aangewezen op een standaard [Mapfile](http://www.mapserver.org/mapfile/). Voor uitleg over de Mapfile wordt verwezen naar de documentatie hierover. Voor algemene informatie over Mapserver wordt verwezen naar [architectuur-info](http://github.so.kadaster.nl/PDOK/architectuur-info/tree/master/mapserver).

Met het Python-script kan een directory met SLD's a.d.h.v. een metabestand (CSV) worden omgezet naar een Mapfile. Benodigdheden:

* [Python 2.7](https://www.python.org/downloads/windows/)
* [XML Starlet](http://xmlstar.sourceforge.net/)

Aanroep: `python sld2basemap.py <CSV-file> <SLD-dir> [<Title>]`

Parameters:
* CSV-file: bestand met meta-informatie. Het CSV-bestand bevat 3 of 4 kolommen met de naam van het Geopackage-bestand, de laagnaam en de naam van het stijlbestand. De optionele 4e kolom bevat het geometrietype (point, line, area). Ieder record wordt omgezet naar één laag in de Mapfile. Wanneer er slechts 3 kolommen zijn opgegeven, wordt het geometrietype bepaald a.d.h.v. het voorkomen van de string `lijn` of `vlak` in de laagnaam.
* SLD-dir: naam van de directory waar de SLD-bestanden staan.
* Title: naam van de titel van de Mapserver-instantie (optioneel).

Met de Python-code wordt de Mapfile gemaakt. Er wordt gebruik gemaakt van een tweetal XSLT's om onderdelen van de stijl te genereren. Er is hiervoor gekozen, omdat de SLD's een complexe structuur hebben en het zelf parsen hiervan veel werk zou zijn.

De conversie-applicatie is een work in progress. Het doel is uiteindelijk om het omzetten van de Geoserver-configuratie (met name de stijlen) naar Mapserver te vergemakkelijken. Gebruiksvriendelijkheid was nooit een doel op zich <img src="https://emojipedia-us.s3.amazonaws.com/thumbs/120/apple/118/smiling-face-with-halo_1f607.png" width="16" height="16">.

In de voorbeelden-directory is een aantal voorbeelden te zien van de BRT Achtergrondkaart, CBS Gebiedsindelingen en NWB wegen. Alleen NWB Wegen wordt momenteel in productie geserveerd via Mapserver. Per dataset is de directory met SLD's te zien (gekopieerd vanuit de Geoserver-configuratie), het CSV-bestand met meta-informatie en de uiteindelijke Mapfile.
