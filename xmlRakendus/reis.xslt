<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>
    <xsl:output method="xml" indent="yes"/>

    <xsl:template match="/reisid">
		<style>
			.yellow { background-color: yellow; }
		</style>
		<xsl:for-each select="reis">
			<h1>
				<xsl:value-of select="lennujaam/aeg/@saabumisriik"></xsl:value-of>
			</h1>
			<ul>
				<li>Transport: <xsl:value-of select="@transport"/></li>
				<li>Hind: <xsl:value-of select="@hind"/></li>
				<li>Lennu kestus: <xsl:value-of select="@lennukestus"/></li>
				<li>Lennujaam nimi : <xsl:value-of select="lennujaam/@nimi"/></li>
				<li>Lennujaamnumber : <xsl:value-of select="lennujaam/@number"/></li>
				<li>Lennujaama riigikood : <xsl:value-of select="lennujaam/@riigikood"/></li>
				<li>Lennu valjumislinn : <xsl:value-of select="lennujaam/aeg/@valjumislinn"/></li>
				<li>Valjumisaeg : <xsl:value-of select="lennujaam/aeg/@valjumisaeg"/></li>
			</ul>
		</xsl:for-each>
    </xsl:template>
</xsl:stylesheet>
