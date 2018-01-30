<?xml version="1.0" encoding="UTF-8"?>
<sld:StyledLayerDescriptor xmlns="http://www.opengis.net/sld" xmlns:sld="http://www.opengis.net/sld" xmlns:ogc="http://www.opengis.net/ogc" xmlns:gml="http://www.opengis.net/gml" version="1.0.0">
	<sld:NamedLayer>
		<sld:Name>072_Straatnamen_regionale_wegen_8_14_style</sld:Name>
		<sld:UserStyle>
			<sld:Name>072_Straatnamen_regionale_wegen_8_14_style</sld:Name>
			<sld:Title>072 Straatnamen regionale wegen 8 14 style</sld:Title>
			<sld:FeatureTypeStyle>
				<sld:Name>name</sld:Name>
				<sld:Rule>
					<sld:MinScaleDenominator>750.0</sld:MinScaleDenominator>
					<sld:MaxScaleDenominator>48000.0</sld:MaxScaleDenominator>
					<sld:TextSymbolizer>
						<sld:Label>
							<ogc:PropertyName>nederlandse_straatnaam</ogc:PropertyName>
						</sld:Label>
						<sld:Font>
							<sld:CssParameter name="font-family">Liberation Sans</sld:CssParameter>
							<sld:CssParameter name="font-size">12.5</sld:CssParameter>
							<sld:CssParameter name="font-style">normal</sld:CssParameter>
							<sld:CssParameter name="font-weight">normal</sld:CssParameter>
						</sld:Font>
						<sld:LabelPlacement>
							<sld:LinePlacement>
								<sld:PerpendicularOffset>0</sld:PerpendicularOffset>
							</sld:LinePlacement>
						</sld:LabelPlacement>
						<sld:Fill>
							<sld:CssParameter name="fill">#000000</sld:CssParameter>
						</sld:Fill>
						<sld:VendorOption name="followLine">true</sld:VendorOption>
						<sld:VendorOption name="group">yes</sld:VendorOption>
						<sld:VendorOption name="partials">false</sld:VendorOption>
					</sld:TextSymbolizer>
				</sld:Rule>
			</sld:FeatureTypeStyle>
		</sld:UserStyle>
	</sld:NamedLayer>
</sld:StyledLayerDescriptor>