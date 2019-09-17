<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="text" indent="no" encoding="UTF-8"/>
    <xsl:strip-space elements="*"/>
    <xsl:template match="breakfast_menu">

        <xsl:text>{&#10;&#x9;"entities": [&#10;</xsl:text>
		<xsl:apply-templates select="food" mode="json"/>
        <xsl:text>&#10;&#x9;]&#10;}</xsl:text>

	</xsl:template>

	<xsl:template match="food" mode="json">

		<xsl:text>&#x9;{&#x9;&#10;&#x9;&#x9;"entity": {&#10;</xsl:text>
		<xsl:text>&#x9;&#x9;"name": "</xsl:text>
		<xsl:value-of select="name"/>
        <xsl:text>",&#10;</xsl:text>
		<xsl:text>&#x9;&#x9;"attributes": [&#10;</xsl:text>
		<xsl:apply-templates select="." mode="food_attributes"/>

		<xsl:if test="position() != last()">
			<xsl:text>&#10;&#x9;&#x9;}&#10;&#x9;},&#10;</xsl:text>
		</xsl:if>
		<xsl:if test="position() = last()">
			<xsl:text>&#10;&#x9;&#x9;}&#10;&#x9;}</xsl:text>
		</xsl:if>

	</xsl:template>

	<xsl:template match="food" mode="food_attributes">

		<xsl:text>&#x9;&#x9;&#x9;&#x9;{&#10;</xsl:text>
		<xsl:text>&#x9;&#x9;&#x9;&#x9;&#x9;"name": "description",&#10;</xsl:text>
        <xsl:text>&#x9;&#x9;&#x9;&#x9;&#x9;"value": "</xsl:text>
        <xsl:value-of select="normalize-space(description)"/>
        <xsl:text>"&#10;&#x9;&#x9;&#x9;&#x9;},&#10;</xsl:text>
		<xsl:text>&#x9;&#x9;&#x9;&#x9;{ "price": "</xsl:text>
		<xsl:value-of select="price"/>
		<xsl:text>" },&#10;</xsl:text>
		<xsl:text>&#x9;&#x9;&#x9;&#x9;{ "calories": "</xsl:text>
		<xsl:value-of select="calories"/>
		<xsl:text>" }&#10;&#x9;&#x9;&#x9;]</xsl:text>

		<xsl:if test="position() != last()">
			<xsl:text>,&#10;</xsl:text>
		</xsl:if>

	</xsl:template>

</xsl:stylesheet>