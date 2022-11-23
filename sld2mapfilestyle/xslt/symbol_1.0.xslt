<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
		xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		xmlns:sld="http://www.opengis.net/sld"
		xmlns:xlink="http://www.w3.org/1999/xlink">
    <xsl:output method="text"/>
    <xsl:strip-space elements="*"/>
	<xsl:template name="substringAfterLast">
		<xsl:param name="string" />
		<xsl:param name="delimiter" />
		<xsl:choose>
			<xsl:when test="contains($string, $delimiter)">
				<xsl:call-template name="substringAfterLast">
					<xsl:with-param name="string"
									select="substring-after($string, $delimiter)" />
					<xsl:with-param name="delimiter" select="$delimiter" />
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise><xsl:value-of
					select="$string" /></xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="outputValue">
		<xsl:param name="value"/>
		<xsl:param name="prefix"/>
		<xsl:param name="suffix" select="''"/>
		<xsl:value-of select="concat($prefix, $value, $suffix, '&#xa;')"/>
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
		<xsl:if test="not($elem[1]) and $defaultValue">
			<xsl:call-template name="outputValue">
				<xsl:with-param name="value" select="$defaultValue"/>
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
	<xsl:template name="outputReference">
		<xsl:param name="elem"/>
		<xsl:param name="refPrefix"/>
		<xsl:param name="prefix"/>
		<xsl:if test="$elem[1]">
			<xsl:variable name="value" select="generate-id($elem[1])"/>
			<xsl:value-of select="concat($prefix, '&quot;', $refPrefix, $value, '&quot;', '&#xa;')"/>
		</xsl:if>
	</xsl:template>
   	<!-- Start processing the templates -->
	<xsl:template match="/sld:StyledLayerDescriptor">
		<xsl:for-each select=".//sld:PointSymbolizer/sld:Graphic/sld:Mark|.//sld:TextSymbolizer/sld:Graphic/sld:Mark|.//sld:PointSymbolizer/sld:Graphic/sld:ExternalGraphic">
			<xsl:text>  SYMBOL&#xa;</xsl:text>
			<!-- The content of this symbol is being exported by sld2namedStyles.xslt -->
			<xsl:call-template name="outputElemValue">
				<xsl:with-param name="elem" select="../../../../../sld:Title"/>
				<xsl:with-param name="prefix" select="'    NAME &quot;'"/>
				<xsl:with-param name="suffix" select="concat('-', position(), '&quot;')"/>
			</xsl:call-template>
			<xsl:variable name="wkn" select="sld:WellKnownName/text()"/>
			<xsl:choose>
				<xsl:when test="$wkn = 'circle'">
					<xsl:variable name="prefix" select="'    TYPE '"/>
					<xsl:value-of select="concat($prefix, 'ellipse', '&#xa;')"/>
					<xsl:value-of select="concat('    POINTS ', '1 1 END', '&#xa;')"/>
				</xsl:when>
				<xsl:when test="$wkn = 'square'">
					<xsl:variable name="prefix" select="'    TYPE '"/>
					<xsl:value-of select="concat($prefix, 'vector', '&#xa;')"/>
					<xsl:value-of select="concat('    POINTS ', '0 0 1 0 1 1 0 1 0 0 END', '&#xa;')"/>
				</xsl:when>
				<xsl:otherwise>
					<!-- Do nothing -->
				</xsl:otherwise>
			</xsl:choose>
			<xsl:if test="starts-with($wkn, 'ttf://')">
				<xsl:call-template name="outputValue">
					<xsl:with-param name="value" select="'truetype'"/>
					<xsl:with-param name="prefix" select="'    TYPE '"/>
				</xsl:call-template>
				<xsl:call-template name="outputValueWithQuotes">
					<xsl:with-param name="value" select="substring-after(substring-before($wkn, '#'), 'ttf://')"/>
					<xsl:with-param name="prefix" select="'    FONT '"/>
				</xsl:call-template>
				<xsl:call-template name="outputValueWithQuotes">
					<xsl:with-param name="value" select="concat('&amp;#', substring-after($wkn, '#'), ';')"/>
					<xsl:with-param name="prefix" select="'    CHARACTER '"/>
				</xsl:call-template>
			</xsl:if>
			<xsl:variable name="imagename">
				<xsl:call-template name="substringAfterLast">
					<xsl:with-param name="string" select='sld:OnlineResource/@xlink:href'/>
					<xsl:with-param name="delimiter" select="'/'" />
				</xsl:call-template>
			</xsl:variable>
			<xsl:if test="$imagename != ''">
				<xsl:call-template name="outputValueWithQuotes">
					<xsl:with-param name="value" select="concat('/srv/data/images/',$imagename)"/>
					<xsl:with-param name="prefix" select="'    IMAGE  '"/>
				</xsl:call-template>
				<xsl:variable name="fmt" select="sld:Format/text()"/>
				<xsl:choose>
					<xsl:when test="$fmt = 'image/png'">
						<xsl:value-of select="concat('    TYPE pixmap', '&#xa;')"/>
					</xsl:when>
					<xsl:otherwise>
						<!-- Do nothing -->
					</xsl:otherwise>
				</xsl:choose>
			</xsl:if>
			<xsl:if test="$imagename = ''">
				<xsl:value-of select="concat('    FILLED ', 'true', '&#xa;')"/>
				<xsl:value-of select="concat('    ANCHORPOINT ', '0.5 0.5', '&#xa;')"/>
			</xsl:if>
			<xsl:text>  END&#xa;</xsl:text>
		</xsl:for-each>
	</xsl:template>
</xsl:stylesheet>
