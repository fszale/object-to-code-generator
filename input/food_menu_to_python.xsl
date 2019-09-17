<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="text" indent="no" encoding="UTF-8"/>
    <xsl:strip-space elements="*"/>
    <xsl:template match="breakfast_menu">

		<xsl:apply-templates select="food" mode="json"/>

	</xsl:template>

	<xsl:template match="food" mode="json">

		<xsl:text>&#10;# The following is a python class for xml item "</xsl:text><xsl:value-of select="name"/>
		<xsl:text>"&#10;import logging&#10;&#10;&#10;</xsl:text>
		<xsl:text>class </xsl:text><xsl:value-of select="translate(name,' -','')"/>
		<xsl:text>():
	logger = None
	config = None
		</xsl:text>
		<xsl:apply-templates select="." mode="food_attributes"/>
		<xsl:text>
	def __init__(self):
		logging.basicConfig(format='%(asctime)s %(levelname)-8s %(message)s',
							level=logging.INFO,
							datefmt='%Y-%m-%d %H:%M:%S')
		self.logger = logging.getLogger('class_log')
		return
		</xsl:text>

		<xsl:text>&#10;</xsl:text>

	</xsl:template>

	<xsl:template match="food" mode="food_attributes">

	<xsl:text>
	name = None
	description = None
	value = None
	price = None
	calories = None
	</xsl:text>

	</xsl:template>

</xsl:stylesheet>