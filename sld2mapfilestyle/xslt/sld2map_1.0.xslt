<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
		xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
        xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
		xmlns:sld="http://www.opengis.net/sld"
		xmlns:ogc="http://www.opengis.net/ogc"
		xmlns:gml="http://www.opengis.net/gml">
    <xsl:output method="text"/>
    <xsl:strip-space elements="*"/>
    
	<xsl:key name="minScale" match="//sld:MinScaleDenominator/text()" use="." />
	<xsl:key name="filterValue" match="//ogc:Filter/ogc:PropertyIsEqualTo/ogc:Literal/text()" use="." />
	<xsl:variable name="apos">'</xsl:variable>
	
	<xsl:template name="outputValue">
		<xsl:param name="value"/>
		<xsl:param name="prefix"/>
		<xsl:param name="suffix" select="''"/>
		
		<xsl:value-of select="concat($prefix, normalize-space($value), $suffix, '&#xa;')"/>
	</xsl:template>
	
	<xsl:template name="outputValueWithQuotes">
		<xsl:param name="value"/>
		<xsl:param name="prefix"/>
		
		<xsl:call-template name="outputValue">
			<xsl:with-param name="value" select="$value"/>
			<xsl:with-param name="prefix" select="concat($prefix, '&quot;')"/>
			<xsl:with-param name="suffix" select="'&quot;'"/>
		</xsl:call-template>
	</xsl:template>
	
	<xsl:template name="outputElemValue">
		<xsl:param name="elem"/>
		<xsl:param name="prefix"/>
		<xsl:param name="suffix" select="''"/>
		<xsl:param name="defaultValue"/>
		
		<xsl:if test="$elem[1]">
			<xsl:call-template name="outputValue">
				<xsl:with-param name="value" select="$elem[1]/text()"/>
				<xsl:with-param name="prefix" select="$prefix"/>
				<xsl:with-param name="suffix" select="$suffix"/>
			</xsl:call-template>
		</xsl:if>
		
		<xsl:if test="not($elem[1]) and defaultValue">
			<xsl:call-template name="outputValue">
				<xsl:with-param name="value" select="defaultValue"/>
				<xsl:with-param name="prefix" select="$prefix"/>
				<xsl:with-param name="suffix" select="$suffix"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	
	<xsl:template name="outputElemValueWithQuotes">
		<xsl:param name="elem"/>
		<xsl:param name="prefix"/>
		
		<xsl:call-template name="outputElemValue">
			<xsl:with-param name="elem" select="$elem"/>
			<xsl:with-param name="prefix" select="concat($prefix, '&quot;')"/>
			<xsl:with-param name="suffix" select="'&quot;'"/>
		</xsl:call-template>
	</xsl:template>
	
	<xsl:template name="outputLineJoin">
		<xsl:param name="elem"/>
		<xsl:param name="prefix"/>
		<xsl:param name="suffix" select="''"/>
		
		<xsl:if test="$elem[1]">
			<xsl:variable name="lineJoin">
				<xsl:choose>
					<xsl:when test="$elem[1]/text()='mitre'">miter</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="$elem[1]/text()"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			
			<xsl:call-template name="outputValue">
				<xsl:with-param name="value" select="$lineJoin"/>
				<xsl:with-param name="prefix" select="$prefix"/>
				<xsl:with-param name="suffix" select="$suffix"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	
	<xsl:template name="outputOpacity">
		<xsl:param name="elem"/>
		<xsl:param name="prefix"/>
		<xsl:param name="suffix" select="''"/>
		
		<xsl:if test="$elem[1]">
			<xsl:call-template name="outputValue">
				<xsl:with-param name="value" select="100 * $elem[1]/text()"/>
				<xsl:with-param name="prefix" select="$prefix"/>
				<xsl:with-param name="suffix" select="$suffix"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	
	<xsl:template name="outputFont">
		<xsl:param name="elem"/>
		<xsl:param name="prefix"/>
		<xsl:param name="suffix" select="''"/>
		
		<xsl:if test="$elem[1]">
			<xsl:variable name="family" select="$elem[1]/sld:CssParameter[@name='font-family']/text()"/>
			<xsl:variable name="weight" select="$elem[1]/sld:CssParameter[@name='font-weight']/text()"/>
			<xsl:variable name="style" select="$elem[1]/sld:CssParameter[@name='font-style']/text()"/>
			
			<xsl:variable name="familyMatched">
				<xsl:choose>
					<xsl:when test="$family='Liberation Sans' or $family='Arial' or $family='Sans Serif' or $family='Sans-Serif' or $family='SansSerif' or $family='Verdana'">liberation-sans</xsl:when>
					<xsl:when test="$family='Liberation Serif' or $family='Times New Roman'">liberation-serif</xsl:when>
					<xsl:when test="$family='Liberation Mono' or $family='Courier'">liberation-mono</xsl:when>
					<xsl:when test="$family='ESRI ArcGIS TDN'">esri-arcgis-tdn</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="$family"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
		
			<xsl:variable name="familyFinal">
				<xsl:choose>
					<xsl:when test="$weight='bold' and ($style='italic' or $style='oblique')">
						<xsl:value-of select="concat($familyMatched, '-bold-italic')"/>
					</xsl:when>
					<xsl:when test="$weight='bold'">
						<xsl:value-of select="concat($familyMatched, '-bold')"/>
					</xsl:when>
					<xsl:when test="$style='italic' or $style='oblique'">
						<xsl:value-of select="concat($familyMatched, '-italic')"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select="$familyMatched"/>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			
			<xsl:call-template name="outputValue">
				<xsl:with-param name="value" select="$familyFinal"/>
				<xsl:with-param name="prefix" select="concat($prefix, '&quot;')"/>
				<xsl:with-param name="suffix" select="'&quot;'"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	
	<xsl:template name="outputOffset">
		<xsl:param name="elem"/>
		<xsl:param name="prefix"/>
		<xsl:param name="suffix" select="''"/>
		<xsl:param name="fontSizeElem"/>
		
		<!-- The offset can't be calculated very well, because this should take the label size into account. Regarding
			 the Y value, this is related to the font size only, but regarding the X value, this is also related to the
			 length of the label text. -->
		<xsl:if test="$elem[1] and $elem[1]/sld:AnchorPointX and $elem[1]/sld:AnchorPointY">
			<xsl:variable name="fontSize">
				<xsl:choose>
					<xsl:when test="$fontSizeElem[1]">
						<xsl:value-of select="$fontSizeElem[1]/text()"/>
					</xsl:when>
					<xsl:otherwise>10</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			
			<xsl:variable name="offsetX" select="(0.5 - $elem[1]/sld:AnchorPointX/text()) * $fontSize"/>
			<xsl:variable name="offsetY" select="($elem[1]/sld:AnchorPointY/text() - 0.5) * $fontSize"/>
			
			<xsl:call-template name="outputValue">
				<xsl:with-param name="value" select="concat($offsetX, ' ', $offsetY)"/>
				<xsl:with-param name="prefix" select="$prefix"/>
				<xsl:with-param name="suffix" select="$suffix"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	
	<xsl:template name="outputStroke">
		<xsl:param name="outlinePrefix" select="''"/>
		
		<xsl:choose>
 			<xsl:when test="sld:Stroke/sld:CssParameter[@name='stroke']">
					<xsl:call-template name="outputElemValueWithQuotes">
						<xsl:with-param name="elem" select="sld:Stroke/sld:CssParameter[@name='stroke']"/>
						<xsl:with-param name="prefix" select="concat('        ', $outlinePrefix, 'COLOR')"/>
					</xsl:call-template>	 
			 </xsl:when>
			 <xsl:otherwise>
				<xsl:call-template name="outputValue">
					<xsl:with-param name="value" select="'0 0 0'"/>
					<xsl:with-param name="prefix" select="concat('        ', $outlinePrefix, 'COLOR ')"/>
				</xsl:call-template>
			</xsl:otherwise>
		</xsl:choose>

		
		<xsl:call-template name="outputElemValue">
			<xsl:with-param name="elem" select="sld:Stroke/sld:CssParameter[@name='stroke-width']"/>
			<xsl:with-param name="prefix" select="concat('        ', $outlinePrefix, 'WIDTH ')"/>
		</xsl:call-template>
		<!-- Possible duplicate when style also contains fill-opacity, since Mapserver doesn't distinguish between fill
			 and stroke opacities. -->
		<xsl:call-template name="outputOpacity">
			<xsl:with-param name="elem" select="sld:Stroke/sld:CssParameter[@name='stroke-opacity']"/>
			<xsl:with-param name="prefix" select="'        OPACITY '"/>
		</xsl:call-template>
		<xsl:call-template name="outputElemValue">
			<xsl:with-param name="elem" select="sld:Stroke/sld:CssParameter[@name='stroke-linecap']"/>
			<xsl:with-param name="prefix" select="'        LINECAP '"/>
		</xsl:call-template>
		<xsl:call-template name="outputLineJoin">
			<xsl:with-param name="elem" select="sld:Stroke/sld:CssParameter[@name='stroke-linejoin']"/>
			<xsl:with-param name="prefix" select="'        LINEJOIN '"/>
		</xsl:call-template>
		<xsl:call-template name="outputElemValue">
			<xsl:with-param name="elem" select="sld:Stroke/sld:CssParameter[@name='stroke-dasharray']"/>
			<xsl:with-param name="prefix" select="'        PATTERN '"/>
			<xsl:with-param name="suffix" select="' END'"/>
		</xsl:call-template>
		<xsl:call-template name="outputElemValue">
			<xsl:with-param name="elem" select="sld:Stroke/sld:CssParameter[@name='stroke-dashoffset']"/>
			<xsl:with-param name="prefix" select="'        INITIALGAP '"/>
		</xsl:call-template>
	</xsl:template>
	
	<xsl:template name="outputFill">
		<xsl:call-template name="outputElemValueWithQuotes">
			<xsl:with-param name="elem" select="sld:Fill/sld:CssParameter[@name='fill']"/>
			<xsl:with-param name="prefix" select="'        COLOR '"/>
		</xsl:call-template>
		<xsl:call-template name="outputOpacity">
			<xsl:with-param name="elem" select="sld:Fill/sld:CssParameter[@name='fill-opacity']"/>
			<xsl:with-param name="prefix" select="'        OPACITY '"/>
		</xsl:call-template>
	</xsl:template>
	
	<xsl:template name="outputScaleDenominators">
		<xsl:param name="rule"/>
		
		<xsl:call-template name="outputElemValue">
			<xsl:with-param name="elem" select="$rule/sld:MinScaleDenominator"/>
			<xsl:with-param name="prefix" select="'        MINSCALEDENOM '"/>
		</xsl:call-template>
		<xsl:call-template name="outputElemValue">
			<xsl:with-param name="elem" select="$rule/sld:MaxScaleDenominator"/>
			<xsl:with-param name="prefix" select="'        MAXSCALEDENOM '"/>
		</xsl:call-template>
	</xsl:template>
	
	<xsl:template name="outputClasses">
		<xsl:param name="filterValue" select="''"/>
		<xsl:param name="rules"/>
		
		<xsl:if test="$rules">
			<xsl:text>    CLASS&#xa;</xsl:text>

			<!-- Use the name of the first rule -->
			<xsl:call-template name="outputElemValueWithQuotes">
				<xsl:with-param name="elem" select="$rules[1]/sld:Name"/>
				<xsl:with-param name="prefix" select="'      NAME '"/>
			</xsl:call-template>
			
			<xsl:call-template name="outputValueWithQuotes">
				<xsl:with-param name="value" select="'{group-placeholder}'"/>
				<xsl:with-param name="prefix" select="'      GROUP '"/>
			</xsl:call-template>
			
			<xsl:if test="$filterValue">
				<xsl:call-template name="outputValueWithQuotes">
					<xsl:with-param name="value" select="$filterValue"/>
					<xsl:with-param name="prefix" select="'      EXPRESSION '"/>
				</xsl:call-template>
			</xsl:if>
			
			<xsl:for-each select="$rules">
				<xsl:variable name="currentRule" select="."/>
			
				<xsl:for-each select="sld:LineSymbolizer">
					<xsl:text>      STYLE&#xa;</xsl:text>
					
					<!-- Stroke -->
					<xsl:call-template name="outputStroke" />
					
					<!-- Scale denominators -->
					<xsl:call-template name="outputScaleDenominators">
						<xsl:with-param name="rule" select="$currentRule"/>
					</xsl:call-template>
					
					<xsl:text>      END&#xa;</xsl:text>
					
				</xsl:for-each>
				
				<xsl:for-each select="sld:PolygonSymbolizer">
					<xsl:text>      STYLE&#xa;</xsl:text>
					
					<!-- Fill and stroke -->
					<xsl:call-template name="outputFill" />
					<xsl:call-template name="outputStroke">
						<xsl:with-param name="outlinePrefix" select="'OUTLINE'"/>
					</xsl:call-template>
					
					<!-- Scale denominators -->
					<xsl:call-template name="outputScaleDenominators">
						<xsl:with-param name="rule" select="$currentRule"/>
					</xsl:call-template>
					
					<xsl:text>      END&#xa;</xsl:text>
					
				</xsl:for-each>
				
				<xsl:for-each select="sld:PointSymbolizer">
					<xsl:for-each select="sld:Graphic/sld:Mark">
						<xsl:text>      STYLE&#xa;</xsl:text>
						
						<!-- Symbol properties -->
						<!-- The content of this symbol is being exported by sld2namedStyles.xslt -->
						<xsl:call-template name="outputElemValue">
							<xsl:with-param name="elem" select="../../../../../sld:Title"/>
							<xsl:with-param name="prefix" select="'        SYMBOL &quot;'"/>
							<xsl:with-param name="suffix" select="concat('-', position(), '&quot;')"/>
						</xsl:call-template>
						<xsl:call-template name="outputElemValue">
							<xsl:with-param name="elem" select="../sld:Size"/>
							<xsl:with-param name="prefix" select="'        SIZE '"/>
						</xsl:call-template>
						
						<!-- Fill and stroke -->
						<xsl:call-template name="outputFill" />
						<xsl:call-template name="outputStroke">
							<xsl:with-param name="outlinePrefix" select="'OUTLINE'"/>
						</xsl:call-template>
					
						<!-- Scale denominators -->
						<xsl:call-template name="outputScaleDenominators">
							<xsl:with-param name="rule" select="$currentRule"/>
						</xsl:call-template>
						
						<xsl:text>      END&#xa;</xsl:text>
					</xsl:for-each>
					
				</xsl:for-each>
				
				<xsl:for-each select="sld:TextSymbolizer">
					<xsl:text>      LABEL&#xa;</xsl:text>
					
					<!-- Fill -->
					<xsl:call-template name="outputElemValueWithQuotes">
						<xsl:with-param name="elem" select="sld:Fill/sld:CssParameter[@name='fill']"/>
						<xsl:with-param name="prefix" select="'        COLOR '"/>
					</xsl:call-template>
					<!-- Beware: label contains no opacity! -->
					
					<!-- Label properties -->
					<xsl:call-template name="outputFont">
						<xsl:with-param name="elem" select="sld:Font"/>
						<xsl:with-param name="prefix" select="'        FONT '"/>
					</xsl:call-template>
					<xsl:value-of select="'        TYPE truetype&#xa;'"/>
					<xsl:call-template name="outputValue">
						<xsl:with-param name="value" select="0.8 * sld:Font/sld:CssParameter[@name='font-size']/text()"/>
						<xsl:with-param name="prefix" select="'        SIZE '"/>
						<xsl:with-param name="defaultValue" select="10"/>
					</xsl:call-template>
					<xsl:call-template name="outputElemValue">
						<xsl:with-param name="elem" select="sld:Label/ogc:PropertyName"/>
						<xsl:with-param name="prefix" select="concat('        TEXT ', $apos, '[')"/>
						<xsl:with-param name="suffix" select="concat(']', $apos)"/>
					</xsl:call-template>
					<xsl:call-template name="outputOffset">
						<xsl:with-param name="elem" select="sld:LabelPlacement/sld:PointPlacement/sld:AnchorPoint"/>
						<xsl:with-param name="fontSizeElem" select="sld:Font/sld:CssParameter[@name='font-size']"/>
						<xsl:with-param name="prefix" select="'        OFFSET '"/>
					</xsl:call-template>
					<xsl:call-template name="outputElemValue">
						<xsl:with-param name="elem" select="sld:LabelPlacement/sld:PointPlacement/sld:Rotation/ogc:Sub/ogc:PropertyName"/>
						<xsl:with-param name="prefix" select="'        ANGLE ['"/>
						<xsl:with-param name="suffix" select="']'"/>
					</xsl:call-template>
					
					<xsl:if test="sld:LabelPlacement/sld:LinePlacement">
						<xsl:value-of select="'        ANGLE FOLLOW&#xa;'"/>
					</xsl:if>
					
					<xsl:for-each select="sld:Graphic/sld:Mark">
						<xsl:text>        STYLE&#xa;</xsl:text>
						
						<!-- Symbol properties -->
						<!-- The content of this symbol is being exported by sld2namedStyles.xslt -->
						<!--xsl:call-template name="outputElemValue">
							<xsl:with-param name="elem" select="../../../../../sld:Title"/>
							<xsl:with-param name="prefix" select="'          SYMBOL &quot;'"/>
							<xsl:with-param name="suffix" select="concat('-', position(), '&quot;')"/>
						</xsl:call-template>
						<xsl:call-template name="outputElemValue">
							<xsl:with-param name="elem" select="../sld:Size"/>
							<xsl:with-param name="prefix" select="'          SIZE '"/>
						</xsl:call-template-->
						
						<xsl:text>          GEOMTRANSFORM labelpoly&#xa;</xsl:text>
						
						<!-- Fill and stroke -->
						<xsl:call-template name="outputFill" />
						<xsl:call-template name="outputStroke">
							<xsl:with-param name="outlinePrefix" select="'OUTLINE'"/>
						</xsl:call-template>
						
						<xsl:text>        END&#xa;</xsl:text>
					</xsl:for-each>
					
					<!-- Scale denominators -->
					<xsl:call-template name="outputScaleDenominators">
						<xsl:with-param name="rule" select="$currentRule"/>
					</xsl:call-template>
					
					<xsl:text>      END&#xa;</xsl:text>
					
				</xsl:for-each>
				
			</xsl:for-each>
			<xsl:text>    END&#xa;</xsl:text>
		</xsl:if>
	
	</xsl:template>
	
   	<!-- Start processing the templates -->
	<xsl:template match="/sld:StyledLayerDescriptor">

		<xsl:if test="//ogc:Filter/ogc:PropertyIsEqualTo/ogc:Literal">
			<xsl:variable name="filterProperty" select="//ogc:Filter/ogc:PropertyIsEqualTo/ogc:PropertyName/text()"/>
			<xsl:value-of select="concat('    CLASSITEM ', $filterProperty, '&#xa;')"/>
			<xsl:for-each select="//ogc:Filter/ogc:PropertyIsEqualTo/ogc:Literal/text()[generate-id() = generate-id(key('filterValue',.)[1])]">
				<xsl:variable name="filterValue" select="."/>
				<xsl:call-template name="outputClasses">
					<xsl:with-param name="filterValue" select="$filterValue"/>
					<xsl:with-param name="rules" select="//sld:Rule[ogc:Filter/ogc:PropertyIsEqualTo/ogc:Literal/text()=$filterValue]"/>
				</xsl:call-template>
			</xsl:for-each>
		</xsl:if>
		
		<xsl:if test="not(//ogc:Filter/ogc:PropertyIsEqualTo/ogc:Literal)">
			<!-- No filters testing for equality, for example BRTA gebouwVlak_9_14 -->
			<xsl:call-template name="outputClasses">
				<!-- There should be only one rule in this case -->
				<xsl:with-param name="rules" select="//sld:Rule"/>
			</xsl:call-template>
		</xsl:if>
		
	</xsl:template>

</xsl:stylesheet>
