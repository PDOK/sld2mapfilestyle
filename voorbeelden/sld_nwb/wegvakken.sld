<?xml version="1.0" encoding="ISO-8859-1"?>
<StyledLayerDescriptor xmlns:xlink='http://www.w3.org/1999/xlink' xmlns:gml='http://www.opengis.net/gml' xmlns:ogc='http://www.opengis.net/ogc' xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance' version='1.0.0' xsi:schemaLocation='http://www.opengis.net/sld StyledLayerDescriptor.xsd' xmlns='http://www.opengis.net/sld' >
	<NamedLayer>
		<Name>
			<![CDATA[NWB_wegen_wegvakken]]>
		</Name>
		<UserStyle>
			<Title>NWB_wegen_wegvakken</Title>
			<FeatureTypeStyle>
				<Rule>
					<Name>
						<![CDATA[Gemeente]]>
					</Name>
					<Title>
						Gemeente
					</Title>
					<ogc:Filter>
						<ogc:PropertyIsEqualTo>
							<ogc:PropertyName>wegbehsrt</ogc:PropertyName>
							<ogc:Literal>
								<![CDATA[G]]>
							</ogc:Literal>
						</ogc:PropertyIsEqualTo>
					</ogc:Filter>
					<MaxScaleDenominator>50000</MaxScaleDenominator>
					<LineSymbolizer>
						<Stroke>
							<CssParameter name="stroke" >#a5a5a5</CssParameter>
							<CssParameter name="stroke-width" >0.43</CssParameter>
							<CssParameter name="stroke-opacity" >1</CssParameter>
						</Stroke>
					</LineSymbolizer>
				</Rule>
				<Rule>
					<Name>
						<![CDATA[Provincie]]>
					</Name>
					<Title>
						Provincie
					</Title>
					<ogc:Filter>
						<ogc:PropertyIsEqualTo>
							<ogc:PropertyName>wegbehsrt</ogc:PropertyName>
							<ogc:Literal>
								<![CDATA[P]]>
							</ogc:Literal>
						</ogc:PropertyIsEqualTo>
					</ogc:Filter>
					<MaxScaleDenominator>50000</MaxScaleDenominator>
					<LineSymbolizer>
						<Stroke>
							<CssParameter name="stroke" >#fe8419</CssParameter>
							<CssParameter name="stroke-width" >2</CssParameter>
							<CssParameter name="stroke-opacity" >1</CssParameter>
						</Stroke>
					</LineSymbolizer>
				</Rule>
				<Rule>
					<Name>
						<![CDATA[Rijk]]>
					</Name>
					<Title>
						Rijk
					</Title>
					<ogc:Filter>
						<ogc:PropertyIsEqualTo>
							<ogc:PropertyName>wegbehsrt</ogc:PropertyName>
							<ogc:Literal>
								<![CDATA[R]]>
							</ogc:Literal>
						</ogc:PropertyIsEqualTo>
					</ogc:Filter>
					<MaxScaleDenominator>50000</MaxScaleDenominator>
					<LineSymbolizer>
						<Stroke>
							<CssParameter name="stroke" >#ff0000</CssParameter>
							<CssParameter name="stroke-width" >2</CssParameter>
							<CssParameter name="stroke-opacity" >1</CssParameter>
						</Stroke>
					</LineSymbolizer>
				</Rule>
				<Rule>
					<Name>
						<![CDATA[Overig]]>
					</Name>
					<Title>
						Overig
					</Title>
					<ogc:Filter>
						<ogc:PropertyIsEqualTo>
							<ogc:PropertyName>wegbehsrt</ogc:PropertyName>
							<ogc:Literal>
								<![CDATA[T]]>
							</ogc:Literal>
						</ogc:PropertyIsEqualTo>
					</ogc:Filter>
					<MaxScaleDenominator>50000</MaxScaleDenominator>
					<LineSymbolizer>
						<Stroke>
							<CssParameter name="stroke" >#b30ffe</CssParameter>
							<CssParameter name="stroke-width" >0.43</CssParameter>
							<CssParameter name="stroke-opacity" >1</CssParameter>
						</Stroke>
					</LineSymbolizer>
				</Rule>
				<Rule>
					<Name>
						<![CDATA[Waterschap]]>
					</Name>
					<Title>
						Waterschap
					</Title>
					<ogc:Filter>
						<ogc:PropertyIsEqualTo>
							<ogc:PropertyName>wegbehsrt</ogc:PropertyName>
							<ogc:Literal>
								<![CDATA[W]]>
							</ogc:Literal>
						</ogc:PropertyIsEqualTo>
					</ogc:Filter>
					<MaxScaleDenominator>50000</MaxScaleDenominator>
					<LineSymbolizer>
						<Stroke>
							<CssParameter name="stroke" >#14a4ab</CssParameter>
							<CssParameter name="stroke-width" >0.43</CssParameter>
							<CssParameter name="stroke-opacity" >1</CssParameter>
						</Stroke>
					</LineSymbolizer>
				</Rule>
			</FeatureTypeStyle>
		</UserStyle>
	</NamedLayer>
</StyledLayerDescriptor>