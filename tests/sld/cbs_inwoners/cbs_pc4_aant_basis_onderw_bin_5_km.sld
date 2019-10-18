<?xml version="1.0" encoding="UTF-8"?>
<sld:StyledLayerDescriptor xmlns="http://www.opengis.net/sld" xmlns:sld="http://www.opengis.net/sld" xmlns:gml="http://www.opengis.net/gml" xmlns:ogc="http://www.opengis.net/ogc" version="1.0.0">
  <sld:NamedLayer>
    <sld:Name>cbs_pc4_aant_basis_onderw_bin_5_km</sld:Name>
    <sld:UserStyle>
      <sld:Name>cbs_pc4_aant_basis_onderw_bin_5_km</sld:Name>
      <sld:Title>cbs_pc4_aant_basis_onderw_bin_5_km</sld:Title>
      <sld:FeatureTypeStyle>
        <sld:Name>aant basis onderw bin 5 km</sld:Name>
        <sld:Rule>
          <sld:Name>geen</sld:Name>
          <sld:Title>geen</sld:Title>
          <ogc:Filter>
            <ogc:PropertyIsBetween>
              <ogc:PropertyName>basisonderwijs_aantal_binnen_5_km</ogc:PropertyName>
              <ogc:LowerBoundary>
                <ogc:Literal>0.0</ogc:Literal>
              </ogc:LowerBoundary>
              <ogc:UpperBoundary>
                <ogc:Literal>0.05</ogc:Literal>
              </ogc:UpperBoundary>
            </ogc:PropertyIsBetween>
          </ogc:Filter>
          <sld:PolygonSymbolizer>
            <sld:Fill>
              <sld:CssParameter name="fill">#4575B5</sld:CssParameter>
            </sld:Fill>
          </sld:PolygonSymbolizer>
        </sld:Rule>
        <sld:Rule>
          <sld:Name>1 tot 3</sld:Name>
          <sld:Title>1 tot 3</sld:Title>
          <ogc:Filter>
            <ogc:PropertyIsBetween>
              <ogc:PropertyName>basisonderwijs_aantal_binnen_5_km</ogc:PropertyName>
              <ogc:LowerBoundary>
                <ogc:Literal>0.050001</ogc:Literal>
              </ogc:LowerBoundary>
              <ogc:UpperBoundary>
                <ogc:Literal>2.4</ogc:Literal>
              </ogc:UpperBoundary>
            </ogc:PropertyIsBetween>
          </ogc:Filter>
          <sld:PolygonSymbolizer>
            <sld:Fill>
              <sld:CssParameter name="fill">#849EBA</sld:CssParameter>
            </sld:Fill>
          </sld:PolygonSymbolizer>
        </sld:Rule>
        <sld:Rule>
          <sld:Name>3 tot 5</sld:Name>
          <sld:Title>3 tot 5</sld:Title>
          <ogc:Filter>
            <ogc:PropertyIsBetween>
              <ogc:PropertyName>basisonderwijs_aantal_binnen_5_km</ogc:PropertyName>
              <ogc:LowerBoundary>
                <ogc:Literal>2.400001</ogc:Literal>
              </ogc:LowerBoundary>
              <ogc:UpperBoundary>
                <ogc:Literal>4.4</ogc:Literal>
              </ogc:UpperBoundary>
            </ogc:PropertyIsBetween>
          </ogc:Filter>
          <sld:PolygonSymbolizer>
            <sld:Fill>
              <sld:CssParameter name="fill">#C0CCBE</sld:CssParameter>
            </sld:Fill>
          </sld:PolygonSymbolizer>
        </sld:Rule>
        <sld:Rule>
          <sld:Name>5 tot 10</sld:Name>
          <sld:Title>5 tot 10</sld:Title>
          <ogc:Filter>
            <ogc:PropertyIsBetween>
              <ogc:PropertyName>basisonderwijs_aantal_binnen_5_km</ogc:PropertyName>
              <ogc:LowerBoundary>
                <ogc:Literal>4.400001</ogc:Literal>
              </ogc:LowerBoundary>
              <ogc:UpperBoundary>
                <ogc:Literal>9.4</ogc:Literal>
              </ogc:UpperBoundary>
            </ogc:PropertyIsBetween>
          </ogc:Filter>
          <sld:PolygonSymbolizer>
            <sld:Fill>
              <sld:CssParameter name="fill">#FFFFBF</sld:CssParameter>
            </sld:Fill>
          </sld:PolygonSymbolizer>
        </sld:Rule>
        <sld:Rule>
          <sld:Name>10 tot 20</sld:Name>
          <sld:Title>10 tot 20</sld:Title>
          <ogc:Filter>
            <ogc:PropertyIsBetween>
              <ogc:PropertyName>basisonderwijs_aantal_binnen_5_km</ogc:PropertyName>
              <ogc:LowerBoundary>
                <ogc:Literal>9.400001</ogc:Literal>
              </ogc:LowerBoundary>
              <ogc:UpperBoundary>
                <ogc:Literal>19.4</ogc:Literal>
              </ogc:UpperBoundary>
            </ogc:PropertyIsBetween>
          </ogc:Filter>
          <sld:PolygonSymbolizer>
            <sld:Fill>
              <sld:CssParameter name="fill">#FAB984</sld:CssParameter>
            </sld:Fill>
          </sld:PolygonSymbolizer>
        </sld:Rule>
        <sld:Rule>
          <sld:Name>20 tot 30</sld:Name>
          <sld:Title>20 tot 30</sld:Title>
          <ogc:Filter>
            <ogc:PropertyIsBetween>
              <ogc:PropertyName>basisonderwijs_aantal_binnen_5_km</ogc:PropertyName>
              <ogc:LowerBoundary>
                <ogc:Literal>19.400001</ogc:Literal>
              </ogc:LowerBoundary>
              <ogc:UpperBoundary>
                <ogc:Literal>29.4</ogc:Literal>
              </ogc:UpperBoundary>
            </ogc:PropertyIsBetween>
          </ogc:Filter>
          <sld:PolygonSymbolizer>
            <sld:Fill>
              <sld:CssParameter name="fill">#ED7551</sld:CssParameter>
            </sld:Fill>
          </sld:PolygonSymbolizer>
        </sld:Rule>
        <sld:Rule>
          <sld:Name>30 of meer</sld:Name>
          <sld:Title>30 of meer</sld:Title>
          <ogc:Filter>
            <ogc:PropertyIsBetween>
              <ogc:PropertyName>basisonderwijs_aantal_binnen_5_km</ogc:PropertyName>
              <ogc:LowerBoundary>
                <ogc:Literal>29.400001</ogc:Literal>
              </ogc:LowerBoundary>
              <ogc:UpperBoundary>
                <ogc:Literal>1000.0</ogc:Literal>
              </ogc:UpperBoundary>
            </ogc:PropertyIsBetween>
          </ogc:Filter>
          <sld:PolygonSymbolizer>
            <sld:Fill>
              <sld:CssParameter name="fill">#D62F27</sld:CssParameter>
            </sld:Fill>
          </sld:PolygonSymbolizer>
        </sld:Rule>
      </sld:FeatureTypeStyle>
    </sld:UserStyle>
  </sld:NamedLayer>
</sld:StyledLayerDescriptor>
