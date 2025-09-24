<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>
    <xsl:output method="xml" indent="yes"/>

    <xsl:template match="/reisid">
		<style>
			table { border-collapse: collapse; width: 100%; }
            th, td { border: 1px solid black; padding: 5px; text-align: left; }
            tr:nth-child(even) { background-color: #7FFFD4; }
			.yellow { background-color: yellow; }
			.red { color: red; font-weight: bold; }
			.blue { color: blue; font-weight: bold; }
		</style> 
		<!-- filtrib ainult lennureisid -->
		<!-- <xsl:for-each select="reis[contains(@transport, 'Air')]"> -->
		<!-- Sorteerimine atribuudi lennukestus järgi, numbriline, kasvavas järjekorras -->
			<!-- 
			- kolmas tase (aeg)
			<h1 class="yellow">
				<xsl:value-of select="lennujaam/aeg/@saabumisriik"></xsl:value-of>
			</h1>
			<ul>
				 - tekst muutub punaseks, kui transport on Chevrolet 
				 <li>
                    <xsl:attribute name="class">
                        <xsl:if test="@transport = 'Chevrolet'">red</xsl:if>
                    </xsl:attribute>
                    Transport: <xsl:value-of select="@transport"/>
                </li>
				- siniseks, kui hind on üle 60
				<li>
					<xsl:attribute name="class">
						&gt see on sümbol > (rohkem)
						<xsl:if test="@hind &gt; 60">blue</xsl:if>
					</xsl:attribute>
					Hind: <xsl:value-of select="@hind"/>
				</li>
				<li>Transpordi hind: <xsl:value-of select="@transpordi_hind"/></li>
				<li>Majutus: <xsl:value-of select="@majutus"/></li>
				<li>Ekskursioon: <xsl:value-of select="@ekskursioon"/></li>
				<li>Muu: <xsl:value-of select="@muu"/></li>
				<li>Lennu kestus: <xsl:value-of select="@lennukestus"/></li>
				<li>Lennujaam nimi : <xsl:value-of select="lennujaam/@nimi"/></li>
				<li>Lennujaamnumber : <xsl:value-of select="lennujaam/@number"/></li>
				<li>Lennujaama riigikood : <xsl:value-of select="lennujaam/@riigikood"/></li>
				- kolmas tase (aeg)
				<li class="yellow">Lennu valjumislinn : <xsl:value-of select="lennujaam/aeg/@valjumislinn"/></li>
				<li class="yellow">Valjumisaeg : <xsl:value-of select="lennujaam/aeg/@valjumisaeg"/></li>
				<li>
					<xsl:variable name="kokku" select="number(@hind) + number(@transpordi_hind) + number(@majutus) + number(@ekskursioon) + number(@muu)"/>
					Kogumaksumuse: 
					<xsl:value-of select="$kokku"/>
				</li>
			</ul> -->
			<table>
				<tr>
					<th>Transport</th>
					<th>Hind</th>
					<th>Transpordi hind</th>
					<th>Majutus</th>
					<th>Ekskursioon</th>
					<th>Muu</th>
					<th>Lennu kestus</th>
					<th>Lennujaam nimi</th>
					<th>Lennujaamnumber</th>
					<th>Lennujaama riigikood</th>
					<th>Lennu valjumislinn</th>
					<th>Valjumisaeg</th>
					<th>Kogumaksumuse</th>
				</tr>
				<xsl:for-each select="reis">
				<!-- Ülesanne 1: Näita ainult lennud, mille hind on üle 50 
				<xsl:for-each select="reis[@hind &gt; 50]"> -->
				<!-- Ülesanne 2: Näita ainult lende, kus transport sisaldab „Airbus“
				<xsl:for-each select="reis[contains(@transport, 'Airbus')]"> -->
					<xsl:sort select="number(@lennukestus)" data-type="number" order="ascending"/>
						<xsl:variable name="varv" select="(position() * 30) mod 360"/>
						<tr>
							<xsl:attribute name="style">
								<xsl:text>background-color: hsl(</xsl:text>
								<xsl:value-of select="$varv"/>
								<xsl:text>, 50%, 80%);</xsl:text>
							</xsl:attribute>
							<td><xsl:value-of select="@transport"/></td>
							<td><xsl:value-of select="@hind"/></td>
							<td><xsl:value-of select="@transpordi_hind"/></td>
							<td><xsl:value-of select="@majutus"/></td>
							<td><xsl:value-of select="@ekskursioon"/></td>
							<td><xsl:value-of select="@muu"/></td>
							<td><xsl:value-of select="@lennukestus"/></td>
							<td><xsl:value-of select="lennujaam/@nimi"/></td>
							<!-- Ülesanne 3: Näita ainult lende, mille lennujaama number algab tähega „N”, tekst on punane. 
							<xsl:for-each select="reis[starts-with(lennujaam/@number, 'N')]">
							<td>
								<xsl:attribute name="style">
									color: red;
								</xsl:attribute>
								<xsl:value-of select="lennujaam/@number"/>
							</td> -->
							<td><xsl:value-of select="lennujaam/@number"/></td> 
							<td><xsl:value-of select="lennujaam/@riigikood"/></td>
							<td><xsl:value-of select="lennujaam/aeg/@valjumislinn"/></td>
							<td><xsl:value-of select="lennujaam/aeg/@valjumisaeg"/></td>
							<td>
								<xsl:variable name="kokku" select="number(@hind) + number(@transpordi_hind) + number(@majutus) + number(@ekskursioon) + number(@muu)"/>
								<xsl:value-of select="format-number($kokku,'0.00')"/>
							</td>
						</tr>
				</xsl:for-each>
			</table>
    </xsl:template>
</xsl:stylesheet>   
