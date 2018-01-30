<?xml version="1.0" encoding="ISO-8859-1"?>
<StyledLayerDescriptor xmlns:xlink='http://www.w3.org/1999/xlink' xmlns:gml='http://www.opengis.net/gml' xmlns:ogc='http://www.opengis.net/ogc' xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance' version='1.0.0' xsi:schemaLocation='http://www.opengis.net/sld StyledLayerDescriptor.xsd' xmlns='http://www.opengis.net/sld' >
	<NamedLayer>
		<Name><![CDATA[Hectopunten]]></Name>
		<UserStyle>
			<Name>Hectopunten</Name>
			<Title>Hectopunten</Title>
			<FeatureTypeStyle>
				<Rule>
					<Name><![CDATA[Hectopunten]]></Name>
					<Title><![CDATA[Hectopunten]]></Title>
					<MaxScaleDenominator>50000</MaxScaleDenominator>
					<PointSymbolizer>
						<Graphic>
							<Mark>
								<WellKnownName>square</WellKnownName>
								<Fill>
									<CssParameter name="fill">#808080</CssParameter>
								</Fill>
								<Stroke>
									<CssParameter name="stroke">#000000</CssParameter>
									<CssParameter name="stroke-width">1</CssParameter>
								</Stroke>
							</Mark>
							<Size>6</Size>
						</Graphic>
					</PointSymbolizer>
				</Rule>
				<Rule>
					<Name><![CDATA[Hectopunten]]></Name>
					<Title><![CDATA[Hectopunten]]></Title>
					<MaxScaleDenominator>50000</MaxScaleDenominator>
					<TextSymbolizer>
						<Label>
							<ogc:PropertyName><![CDATA[hectometerang]]></ogc:PropertyName>
						</Label>
						<Font>
							<CssParameter name="font-family" >Arial</CssParameter>
							<CssParameter name="font-weight" >normal</CssParameter>
							<CssParameter name="font-weight" >normal</CssParameter>
							<CssParameter name="font-size" >8</CssParameter>
						</Font>
						<LabelPlacement>
							<PointPlacement>
								<AnchorPoint>
									<AnchorPointX>2</AnchorPointX>
									<AnchorPointY>2</AnchorPointY>
								</AnchorPoint>
							</PointPlacement>
						</LabelPlacement>
						<Fill>
							<CssParameter name="fill" >#000000</CssParameter>
						</Fill>
					</TextSymbolizer>
				</Rule>
			</FeatureTypeStyle>
		</UserStyle>
	</NamedLayer>
</StyledLayerDescriptor>