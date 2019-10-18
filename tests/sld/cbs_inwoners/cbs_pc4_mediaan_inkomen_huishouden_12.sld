<?xml version="1.0" encoding="UTF-8"?><sld:StyledLayerDescriptor xmlns="http://www.opengis.net/sld" xmlns:sld="http://www.opengis.net/sld" xmlns:ogc="http://www.opengis.net/ogc" xmlns:gml="http://www.opengis.net/gml" version="1.0.0">
  <sld:NamedLayer>
    <sld:Name>cbs pc6 mediaan inkomen huishouden</sld:Name>
    <sld:UserStyle>
      <sld:Name>cbs_pc4_mediaan_inkomen_huishouden_12</sld:Name>
      <sld:Title>cbs_pc4_mediaan_inkomen_huishouden_12</sld:Title>
      <sld:FeatureTypeStyle>
        <sld:Name>mediaan inkomen huishouden</sld:Name>
        <sld:Rule>
          <sld:Name>80-100 hoog</sld:Name>
          <sld:Title>80-100 hoog</sld:Title>
          <ogc:Filter>
            <ogc:PropertyIsEqualTo>
              <ogc:PropertyName>mediaan_inkomen_huishouden</ogc:PropertyName>
              <ogc:Literal>80-100 hoog</ogc:Literal>
            </ogc:PropertyIsEqualTo>
          </ogc:Filter>
          <sld:PolygonSymbolizer>
            <sld:Fill>
              <sld:CssParameter name="fill">#D62F27</sld:CssParameter>
            </sld:Fill>
          </sld:PolygonSymbolizer>
        </sld:Rule>
        <sld:Rule>
          <sld:Name>60-100 boven midden tot hoog</sld:Name>
          <sld:Title>60-100 boven midden tot hoog</sld:Title>
          <ogc:Filter>
            <ogc:PropertyIsEqualTo>
              <ogc:PropertyName>mediaan_inkomen_huishouden</ogc:PropertyName>
              <ogc:Literal>60-100 boven midden tot hoog</ogc:Literal>
            </ogc:PropertyIsEqualTo>
          </ogc:Filter>
          <sld:PolygonSymbolizer>
            <sld:Fill>
              <sld:CssParameter name="fill">#D62F27</sld:CssParameter>
            </sld:Fill>
          </sld:PolygonSymbolizer>
        </sld:Rule>
        <sld:Rule>
          <sld:Name>60-80 boven midden</sld:Name>
          <sld:Title>60-80 boven midden</sld:Title>
          <ogc:Filter>
            <ogc:PropertyIsEqualTo>
              <ogc:PropertyName>mediaan_inkomen_huishouden</ogc:PropertyName>
              <ogc:Literal>60-80 boven midden</ogc:Literal>
            </ogc:PropertyIsEqualTo>
          </ogc:Filter>
          <sld:PolygonSymbolizer>
            <sld:Fill>
              <sld:CssParameter name="fill">#F59869</sld:CssParameter>
            </sld:Fill>
          </sld:PolygonSymbolizer>
        </sld:Rule>
        <sld:Rule>
          <sld:Name>40-80 midden tot boven midden</sld:Name>
          <sld:Title>40-80 midden tot boven midden</sld:Title>
          <ogc:Filter>
            <ogc:PropertyIsEqualTo>
              <ogc:PropertyName>mediaan_inkomen_huishouden</ogc:PropertyName>
              <ogc:Literal>40-80 midden tot boven midden</ogc:Literal>
            </ogc:PropertyIsEqualTo>
          </ogc:Filter>
          <sld:PolygonSymbolizer>
            <sld:Fill>
              <sld:CssParameter name="fill">#F59869</sld:CssParameter>
            </sld:Fill>
          </sld:PolygonSymbolizer>
        </sld:Rule>
        <sld:Rule>
          <sld:Name>40-60 midden</sld:Name>
          <sld:Title>40-60 midden</sld:Title>
          <ogc:Filter>
            <ogc:PropertyIsEqualTo>
              <ogc:PropertyName>mediaan_inkomen_huishouden</ogc:PropertyName>
              <ogc:Literal>40-60 midden</ogc:Literal>
            </ogc:PropertyIsEqualTo>
          </ogc:Filter>
          <sld:PolygonSymbolizer>
            <sld:Fill>
              <sld:CssParameter name="fill">#FFFFB5</sld:CssParameter>
            </sld:Fill>
          </sld:PolygonSymbolizer>
        </sld:Rule>
        <sld:Rule>
          <sld:Name>20-80 onder midden tot boven midden</sld:Name>
          <sld:Title>20-80 onder midden tot boven midden</sld:Title>
          <ogc:Filter>
            <ogc:PropertyIsEqualTo>
              <ogc:PropertyName>mediaan_inkomen_huishouden</ogc:PropertyName>
              <ogc:Literal>20-80 onder midden tot boven midden</ogc:Literal>
            </ogc:PropertyIsEqualTo>
          </ogc:Filter>
          <sld:PolygonSymbolizer>
            <sld:Fill>
              <sld:CssParameter name="fill">#FFFFB5</sld:CssParameter>
            </sld:Fill>
          </sld:PolygonSymbolizer>
        </sld:Rule>        <sld:Rule>
          <sld:Name>20-60 onder midden tot midden</sld:Name>
          <sld:Title>20-60 onder midden tot midden</sld:Title>
          <ogc:Filter>
            <ogc:PropertyIsEqualTo>
              <ogc:PropertyName>mediaan_inkomen_huishouden</ogc:PropertyName>
              <ogc:Literal>20-60 onder midden tot midden</ogc:Literal>
            </ogc:PropertyIsEqualTo>
          </ogc:Filter>
          <sld:PolygonSymbolizer>
            <sld:Fill>
              <sld:CssParameter name="fill">#4575B5</sld:CssParameter>
            </sld:Fill>
          </sld:PolygonSymbolizer>
        </sld:Rule>
        <sld:Rule>
          <sld:Name>20-40 onder midden</sld:Name>
          <sld:Title>20-40 onder midden</sld:Title>
          <ogc:Filter>
            <ogc:PropertyIsEqualTo>
              <ogc:PropertyName>mediaan_inkomen_huishouden</ogc:PropertyName>
              <ogc:Literal>20-40 onder midden</ogc:Literal>
            </ogc:PropertyIsEqualTo>
          </ogc:Filter>
          <sld:PolygonSymbolizer>
            <sld:Fill>
              <sld:CssParameter name="fill">#4575B5</sld:CssParameter>
            </sld:Fill>
          </sld:PolygonSymbolizer>
        </sld:Rule>
        <sld:Rule>
          <sld:Name>00-60 laag tot midden</sld:Name>
          <sld:Title>00-60 laag tot midden</sld:Title>
          <ogc:Filter>
            <ogc:PropertyIsEqualTo>
              <ogc:PropertyName>mediaan_inkomen_huishouden</ogc:PropertyName>
              <ogc:Literal>00-60 laag tot midden</ogc:Literal>
            </ogc:PropertyIsEqualTo>
          </ogc:Filter>
          <sld:PolygonSymbolizer>
            <sld:Fill>
              <sld:CssParameter name="fill">#4575B5</sld:CssParameter>
            </sld:Fill>
          </sld:PolygonSymbolizer>
        </sld:Rule>
        <sld:Rule>
          <sld:Name>00-40 laag tot onder midden</sld:Name>
          <sld:Title>00-40 laag tot onder midden</sld:Title>
          <ogc:Filter>
            <ogc:PropertyIsEqualTo>
              <ogc:PropertyName>mediaan_inkomen_huishouden</ogc:PropertyName>
              <ogc:Literal>00-40 laag tot onder midden</ogc:Literal>
            </ogc:PropertyIsEqualTo>
          </ogc:Filter>
          <sld:PolygonSymbolizer>
            <sld:Fill>
              <sld:CssParameter name="fill">#002673</sld:CssParameter>
            </sld:Fill>
          </sld:PolygonSymbolizer>
        </sld:Rule>
        <sld:Rule>
          <sld:Name>00-20 laag</sld:Name>
          <sld:Title>00-20 laag</sld:Title>
          <ogc:Filter>
            <ogc:PropertyIsEqualTo>
              <ogc:PropertyName>mediaan_inkomen_huishouden</ogc:PropertyName>
              <ogc:Literal>00-20 laag</ogc:Literal>
            </ogc:PropertyIsEqualTo>
          </ogc:Filter>
          <sld:PolygonSymbolizer>
            <sld:Fill>
              <sld:CssParameter name="fill">#002673</sld:CssParameter>
            </sld:Fill>
          </sld:PolygonSymbolizer>
        </sld:Rule>
        <sld:Rule>
          <sld:Name>onclassificeerbaar</sld:Name>
          <sld:Title>onclassificeerbaar</sld:Title>
          <ogc:Filter>
            <ogc:PropertyIsEqualTo>
              <ogc:PropertyName>mediaan_inkomen_huishouden</ogc:PropertyName>
              <ogc:Literal>onclassificeerbaar</ogc:Literal>
            </ogc:PropertyIsEqualTo>
          </ogc:Filter>
          <sld:PolygonSymbolizer>
            <sld:Fill>
              <sld:CssParameter name="fill">#EAEAEA</sld:CssParameter>
            </sld:Fill>
          </sld:PolygonSymbolizer>
        </sld:Rule>
      </sld:FeatureTypeStyle>
    </sld:UserStyle>
  </sld:NamedLayer>
</sld:StyledLayerDescriptor>

