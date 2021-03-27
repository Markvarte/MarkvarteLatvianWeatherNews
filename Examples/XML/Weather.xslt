<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/">
    <html>
      <body>
        <h2>
          Laika ziņas-<xsl:value-of select="//city/@name"/><br/>
          (<xsl:value-of select="//city/coord/@lon"/>/<xsl:value-of select="//city/coord/@lat"/>)
        </h2>
        <table border="1" class="table">
          <tr bgcolor="#9acd32">
            <th>Parametrs</th>
            <th>Vērtība</th>
          </tr>
          <tr>
            <td>Saule lec</td>
            <td>
              <xsl:value-of select="//@rise"/>
            </td>
          </tr>
          <tr>
            <td>Saule riet</td>
            <td>
              <xsl:value-of select="//@set"/>
            </td>
          </tr>
          <tr>
            <td>Temperatūra</td>
            <td>
              <xsl:value-of select="//temperature/@value"/>
            </td>
          </tr>
          <tr>
            <td>Temperatūras amplitūda (min/max)</td>
            <td>
              <xsl:value-of select="//temperature/@min"/>/
              <xsl:value-of select="//temperature/@max"/>
            </td>
          </tr>
          <tr>
            <td>Sajūtas kā</td>
            <td>
              <xsl:value-of select="//feels_like/@value"/>
            </td>
          </tr>
          <tr>
            <td>Mitrums %</td>
            <td>
              <xsl:value-of select="//humidity/@value"/>
            </td>
          </tr>
          <tr>
            <td>Atmosfēras spiediens hPa</td>
            <td>
              <xsl:value-of select="//pressure/@value"/>
            </td>
          </tr>
          <tr>
            <td>Vējš m/s</td>
            <td>
              <xsl:value-of select="//wind/speed/@value"/>
              <xsl:value-of select="//wind/speed/@name"/>/
              <xsl:value-of select="//wind/direction/@name"/>
            </td>
          </tr>
          <tr>
            <td>Status</td>
            <td>
              <xsl:value-of select="//weather/@value"/>
              <img>
                <xsl:attribute name="alt">
                </xsl:attribute>
                <xsl:attribute name="src">
                  https://openweathermap.org/img/wn/<xsl:value-of select="//weather/@icon"/>.png
                </xsl:attribute>
              </img>
            </td>
          </tr>
        </table>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
