<?xml version="1.0" encoding="UTF-8"?>
<sld:StyledLayerDescriptor xmlns="http://www.opengis.net/sld" 
    xmlns:sld="http://www.opengis.net/sld" 
    xmlns:gml="http://www.opengis.net/gml" 
    xmlns:ogc="http://www.opengis.net/ogc" version="1.0.0">
    <sld:NamedLayer>
        <sld:Name>cbs_pc4_aant_huisartsprak_bin_1_km</sld:Name>
        <sld:UserStyle>
            <sld:Name>cbs_pc4_aant_huisartsprak_bin_1_km</sld:Name>
            <sld:Title>cbs_pc4_aant_huisartsprak_bin_1_km</sld:Title>
            <sld:FeatureTypeStyle>
                <sld:Name>aant huisartsprak bin 1 km</sld:Name>
                <sld:Rule>
                    <sld:Name>geen</sld:Name>
                    <sld:Title>geen</sld:Title>
                    <ogc:Filter>
                        <ogc:PropertyIsBetween>
                            <ogc:PropertyName>huisartsenpraktijk_aantal_binnen_1_km</ogc:PropertyName>
                            <ogc:LowerBoundary>
                                <ogc:Literal>0.0</ogc:Literal>
                            </ogc:LowerBoundary>
                            <ogc:UpperBoundary>
                                <ogc:Literal>0.3</ogc:Literal>
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
                    <sld:Name>1</sld:Name>
                    <sld:Title>1</sld:Title>
                    <ogc:Filter>
                        <ogc:PropertyIsBetween>
                            <ogc:PropertyName>huisartsenpraktijk_aantal_binnen_1_km</ogc:PropertyName>
                            <ogc:LowerBoundary>
                                <ogc:Literal>0.300001</ogc:Literal>
                            </ogc:LowerBoundary>
                            <ogc:UpperBoundary>
                                <ogc:Literal>1.4</ogc:Literal>
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
                    <sld:Name>2</sld:Name>
                    <sld:Title>2</sld:Title>
                    <ogc:Filter>
                        <ogc:PropertyIsBetween>
                            <ogc:PropertyName>huisartsenpraktijk_aantal_binnen_1_km</ogc:PropertyName>
                            <ogc:LowerBoundary>
                                <ogc:Literal>1.400001</ogc:Literal>
                            </ogc:LowerBoundary>
                            <ogc:UpperBoundary>
                                <ogc:Literal>2.4</ogc:Literal>
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
                    <sld:Name>3</sld:Name>
                    <sld:Title>3</sld:Title>
                    <ogc:Filter>
                        <ogc:PropertyIsBetween>
                            <ogc:PropertyName>huisartsenpraktijk_aantal_binnen_1_km</ogc:PropertyName>
                            <ogc:LowerBoundary>
                                <ogc:Literal>2.400001</ogc:Literal>
                            </ogc:LowerBoundary>
                            <ogc:UpperBoundary>
                                <ogc:Literal>3.4</ogc:Literal>
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
                    <sld:Name>4</sld:Name>
                    <sld:Title>4</sld:Title>
                    <ogc:Filter>
                        <ogc:PropertyIsBetween>
                            <ogc:PropertyName>huisartsenpraktijk_aantal_binnen_1_km</ogc:PropertyName>
                            <ogc:LowerBoundary>
                                <ogc:Literal>3.400001</ogc:Literal>
                            </ogc:LowerBoundary>
                            <ogc:UpperBoundary>
                                <ogc:Literal>4.4</ogc:Literal>
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
                    <sld:Name>5</sld:Name>
                    <sld:Title>5</sld:Title>
                    <ogc:Filter>
                        <ogc:PropertyIsBetween>
                            <ogc:PropertyName>huisartsenpraktijk_aantal_binnen_1_km</ogc:PropertyName>
                            <ogc:LowerBoundary>
                                <ogc:Literal>4.400001</ogc:Literal>
                            </ogc:LowerBoundary>
                            <ogc:UpperBoundary>
                                <ogc:Literal>5.4</ogc:Literal>
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
                    <sld:Name>6 of meer</sld:Name>
                    <sld:Title>6 of meer</sld:Title>
                    <ogc:Filter>
                        <ogc:PropertyIsBetween>
                            <ogc:PropertyName>huisartsenpraktijk_aantal_binnen_1_km</ogc:PropertyName>
                            <ogc:LowerBoundary>
                                <ogc:Literal>5.400001</ogc:Literal>
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