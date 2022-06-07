<?xml version="1.0" encoding="UTF-8"?>
<sld:StyledLayerDescriptor xmlns:sld="http://www.opengis.net/sld" version="1.0.0">
    <sld:NamedLayer>
        <sld:Name>cbs pc4 aant inw uitk min aow</sld:Name>
        <sld:UserStyle>
            <sld:Name>cbs_pc4_aant_inw_uitk_min_aow</sld:Name>
            <sld:Title>cbs_pc4_aant_inw_uitk_min_aow</sld:Title>
            <sld:FeatureTypeStyle>
                <sld:Rule>
                    <sld:Name>geheim of 0-4</sld:Name>
                    <sld:Title>geheim of 0-4</sld:Title>
                    <sld:PolygonSymbolizer>
                        <sld:Stroke>
                            <sld:CssParameter name="stroke">#4575B5</sld:CssParameter>
                            <sld:CssParameter name="stroke-width">0.5</sld:CssParameter>
                            <sld:CssParameter name="stroke-opacity">1</sld:CssParameter>
                        </sld:Stroke>
                    </sld:PolygonSymbolizer>
                </sld:Rule>
                <sld:Rule>
                    <sld:Name>5 tot 100</sld:Name>
                    <sld:Title>5 tot 100</sld:Title>
                    <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
                        <ogc:And>
                            <ogc:PropertyIsGreaterThanOrEqualTo>
                                <ogc:PropertyName>aantal_personen_met_uitkering_onder_aowlft</ogc:PropertyName>
                                <ogc:Literal>4.000001</ogc:Literal>
                            </ogc:PropertyIsGreaterThanOrEqualTo>
                            <ogc:PropertyIsLessThan>
                                <ogc:PropertyName>aantal_personen_met_uitkering_onder_aowlft</ogc:PropertyName>
                                <ogc:Literal>99.0</ogc:Literal>
                            </ogc:PropertyIsLessThan>
                        </ogc:And>
                    </ogc:Filter>
                    <sld:PointSymbolizer>
                        <sld:Geometry>
                            <ogc:Function xmlns:ogc="http://www.opengis.net/ogc" name="centroid">
                                <ogc:PropertyName>geom</ogc:PropertyName>
                            </ogc:Function>
                        </sld:Geometry>
                        <sld:Graphic>
                            <sld:Mark>
                                <sld:WellKnownName>circle</sld:WellKnownName>
                                <sld:Fill>
                                    <sld:CssParameter name="fill">#00A9E6</sld:CssParameter>
                                    <sld:CssParameter name="fill-opacity">1.0</sld:CssParameter>
                                </sld:Fill>
                            </sld:Mark>
                            <sld:Size>4</sld:Size>
                            <sld:Rotation>0</sld:Rotation>
                        </sld:Graphic>
                    </sld:PointSymbolizer>
                    <sld:PointSymbolizer>
                        <sld:Geometry>
                            <ogc:Function xmlns:ogc="http://www.opengis.net/ogc" name="centroid">
                                <ogc:PropertyName>geom</ogc:PropertyName>
                            </ogc:Function>
                        </sld:Geometry>
                        <sld:Graphic>
                            <sld:Mark>
                                <sld:WellKnownName>circle</sld:WellKnownName>
                                <sld:Stroke>
                                    <sld:CssParameter name="stroke">#000000</sld:CssParameter>
                                    <sld:CssParameter name="stroke-width">0.1</sld:CssParameter>
                                    <sld:CssParameter name="stroke-opacity">1.0</sld:CssParameter>
                                </sld:Stroke>
                            </sld:Mark>
                            <sld:Size>5</sld:Size>
                            <sld:Rotation>0</sld:Rotation>
                        </sld:Graphic>
                    </sld:PointSymbolizer>
                </sld:Rule>
                <sld:Rule>
                    <sld:Name>100 tot 250</sld:Name>
                    <sld:Title>100 tot 250</sld:Title>
                    <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
                        <ogc:And>
                            <ogc:PropertyIsGreaterThanOrEqualTo>
                                <ogc:PropertyName>aantal_personen_met_uitkering_onder_aowlft</ogc:PropertyName>
                                <ogc:Literal>99.000001</ogc:Literal>
                            </ogc:PropertyIsGreaterThanOrEqualTo>
                            <ogc:PropertyIsLessThan>
                                <ogc:PropertyName>aantal_personen_met_uitkering_onder_aowlft</ogc:PropertyName>
                                <ogc:Literal>249.0</ogc:Literal>
                            </ogc:PropertyIsLessThan>
                        </ogc:And>
                    </ogc:Filter>
                    <sld:PointSymbolizer>
                        <sld:Geometry>
                            <ogc:Function xmlns:ogc="http://www.opengis.net/ogc" name="centroid">
                                <ogc:PropertyName>geom</ogc:PropertyName>
                            </ogc:Function>
                        </sld:Geometry>
                        <sld:Graphic>
                            <sld:Mark>
                                <sld:WellKnownName>circle</sld:WellKnownName>
                                <sld:Fill>
                                    <sld:CssParameter name="fill">#00A9E6</sld:CssParameter>
                                    <sld:CssParameter name="fill-opacity">1.0</sld:CssParameter>
                                </sld:Fill>
                            </sld:Mark>
                            <sld:Size>11.75</sld:Size>
                            <sld:Rotation>0</sld:Rotation>
                        </sld:Graphic>
                    </sld:PointSymbolizer>
                    <sld:PointSymbolizer>
                        <sld:Geometry>
                            <ogc:Function xmlns:ogc="http://www.opengis.net/ogc" name="centroid">
                                <ogc:PropertyName>geom</ogc:PropertyName>
                            </ogc:Function>
                        </sld:Geometry>
                        <sld:Graphic>
                            <sld:Mark>
                                <sld:WellKnownName>circle</sld:WellKnownName>
                                <sld:Stroke>
                                    <sld:CssParameter name="stroke">#000000</sld:CssParameter>
                                    <sld:CssParameter name="stroke-width">0.1</sld:CssParameter>
                                    <sld:CssParameter name="stroke-opacity">1.0</sld:CssParameter>
                                </sld:Stroke>
                            </sld:Mark>
                            <sld:Size>12.75</sld:Size>
                            <sld:Rotation>0</sld:Rotation>
                        </sld:Graphic>
                    </sld:PointSymbolizer>
                </sld:Rule>
                <sld:Rule>
                    <sld:Name>250 tot 500</sld:Name>
                    <sld:Title>250 tot 500</sld:Title>
                    <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
                        <ogc:And>
                            <ogc:PropertyIsGreaterThanOrEqualTo>
                                <ogc:PropertyName>aantal_personen_met_uitkering_onder_aowlft</ogc:PropertyName>
                                <ogc:Literal>249.000001</ogc:Literal>
                            </ogc:PropertyIsGreaterThanOrEqualTo>
                            <ogc:PropertyIsLessThan>
                                <ogc:PropertyName>aantal_personen_met_uitkering_onder_aowlft</ogc:PropertyName>
                                <ogc:Literal>499.0</ogc:Literal>
                            </ogc:PropertyIsLessThan>
                        </ogc:And>
                    </ogc:Filter>
                    <sld:PointSymbolizer>
                        <sld:Geometry>
                            <ogc:Function xmlns:ogc="http://www.opengis.net/ogc" name="centroid">
                                <ogc:PropertyName>geom</ogc:PropertyName>
                            </ogc:Function>
                        </sld:Geometry>
                        <sld:Graphic>
                            <sld:Mark>
                                <sld:WellKnownName>circle</sld:WellKnownName>
                                <sld:Fill>
                                    <sld:CssParameter name="fill">#00A9E6</sld:CssParameter>
                                    <sld:CssParameter name="fill-opacity">1.0</sld:CssParameter>
                                </sld:Fill>
                            </sld:Mark>
                            <sld:Size>19</sld:Size>
                            <sld:Rotation>0</sld:Rotation>
                        </sld:Graphic>
                    </sld:PointSymbolizer>
                    <sld:PointSymbolizer>
                        <sld:Geometry>
                            <ogc:Function xmlns:ogc="http://www.opengis.net/ogc" name="centroid">
                                <ogc:PropertyName>geom</ogc:PropertyName>
                            </ogc:Function>
                        </sld:Geometry>
                        <sld:Graphic>
                            <sld:Mark>
                                <sld:WellKnownName>circle</sld:WellKnownName>
                                <sld:Stroke>
                                    <sld:CssParameter name="stroke">#000000</sld:CssParameter>
                                    <sld:CssParameter name="stroke-width">0.1</sld:CssParameter>
                                    <sld:CssParameter name="stroke-opacity">1.0</sld:CssParameter>
                                </sld:Stroke>
                            </sld:Mark>
                            <sld:Size>20</sld:Size>
                            <sld:Rotation>0</sld:Rotation>
                        </sld:Graphic>
                    </sld:PointSymbolizer>
                </sld:Rule>
                <sld:Rule>
                    <sld:Name>500 tot 1.000</sld:Name>
                    <sld:Title>500 tot 1.000</sld:Title>
                    <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
                        <ogc:And>
                            <ogc:PropertyIsGreaterThanOrEqualTo>
                                <ogc:PropertyName>aantal_personen_met_uitkering_onder_aowlft</ogc:PropertyName>
                                <ogc:Literal>499.000001</ogc:Literal>
                            </ogc:PropertyIsGreaterThanOrEqualTo>
                            <ogc:PropertyIsLessThan>
                                <ogc:PropertyName>aantal_personen_met_uitkering_onder_aowlft</ogc:PropertyName>
                                <ogc:Literal>999.0</ogc:Literal>
                            </ogc:PropertyIsLessThan>
                        </ogc:And>
                    </ogc:Filter>
                    <sld:PointSymbolizer>
                        <sld:Geometry>
                            <ogc:Function xmlns:ogc="http://www.opengis.net/ogc" name="centroid">
                                <ogc:PropertyName>geom</ogc:PropertyName>
                            </ogc:Function>
                        </sld:Geometry>
                        <sld:Graphic>
                            <sld:Mark>
                                <sld:WellKnownName>circle</sld:WellKnownName>
                                <sld:Fill>
                                    <sld:CssParameter name="fill">#00A9E6</sld:CssParameter>
                                    <sld:CssParameter name="fill-opacity">1.0</sld:CssParameter>
                                </sld:Fill>
                            </sld:Mark>
                            <sld:Size>27.25</sld:Size>
                            <sld:Rotation>0</sld:Rotation>
                        </sld:Graphic>
                    </sld:PointSymbolizer>
                    <sld:PointSymbolizer>
                        <sld:Geometry>
                            <ogc:Function xmlns:ogc="http://www.opengis.net/ogc" name="centroid">
                                <ogc:PropertyName>geom</ogc:PropertyName>
                            </ogc:Function>
                        </sld:Geometry>
                        <sld:Graphic>
                            <sld:Mark>
                                <sld:WellKnownName>circle</sld:WellKnownName>
                                <sld:Stroke>
                                    <sld:CssParameter name="stroke">#000000</sld:CssParameter>
                                    <sld:CssParameter name="stroke-width">0.1</sld:CssParameter>
                                    <sld:CssParameter name="stroke-opacity">1.0</sld:CssParameter>
                                </sld:Stroke>
                            </sld:Mark>
                            <sld:Size>28.25</sld:Size>
                            <sld:Rotation>0</sld:Rotation>
                        </sld:Graphic>
                    </sld:PointSymbolizer>
                </sld:Rule>
                <sld:Rule>
                    <sld:Name>1.000 of meer</sld:Name>
                    <sld:Title>1.000 of meer</sld:Title>
                    <ogc:Filter xmlns:ogc="http://www.opengis.net/ogc">
                        <ogc:PropertyIsGreaterThanOrEqualTo>
                            <ogc:PropertyName>aantal_personen_met_uitkering_onder_aowlft</ogc:PropertyName>
                            <ogc:Literal>999.000001</ogc:Literal>
                        </ogc:PropertyIsGreaterThanOrEqualTo>
                    </ogc:Filter>
                    <sld:PointSymbolizer>
                        <sld:Geometry>
                            <ogc:Function xmlns:ogc="http://www.opengis.net/ogc" name="centroid">
                                <ogc:PropertyName>geom</ogc:PropertyName>
                            </ogc:Function>
                        </sld:Geometry>
                        <sld:Graphic>
                            <sld:Mark>
                                <sld:WellKnownName>circle</sld:WellKnownName>
                                <sld:Fill>
                                    <sld:CssParameter name="fill">#00A9E6</sld:CssParameter>
                                    <sld:CssParameter name="fill-opacity">1.0</sld:CssParameter>
                                </sld:Fill>
                            </sld:Mark>
                            <sld:Size>34</sld:Size>
                            <sld:Rotation>0</sld:Rotation>
                        </sld:Graphic>
                    </sld:PointSymbolizer>
                    <sld:PointSymbolizer>
                        <sld:Geometry>
                            <ogc:Function xmlns:ogc="http://www.opengis.net/ogc" name="centroid">
                                <ogc:PropertyName>geom</ogc:PropertyName>
                            </ogc:Function>
                        </sld:Geometry>
                        <sld:Graphic>
                            <sld:Mark>
                                <sld:WellKnownName>circle</sld:WellKnownName>
                                <sld:Stroke>
                                    <sld:CssParameter name="stroke">#000000</sld:CssParameter>
                                    <sld:CssParameter name="stroke-width">0.1</sld:CssParameter>
                                    <sld:CssParameter name="stroke-opacity">1.0</sld:CssParameter>
                                </sld:Stroke>
                            </sld:Mark>
                            <sld:Size>35</sld:Size>
                            <sld:Rotation>0</sld:Rotation>
                        </sld:Graphic>
                    </sld:PointSymbolizer>
                </sld:Rule>
            </sld:FeatureTypeStyle>
        </sld:UserStyle>
    </sld:NamedLayer>
</sld:StyledLayerDescriptor>