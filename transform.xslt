<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" indent="yes" omit-xml-declaration="yes"/>
    
    <!-- Get cards-per-row from root element attribute, default to 3 if not specified -->
    <xsl:variable name="cards-per-row">
        <xsl:choose>
            <xsl:when test="/cards/@cards-per-row">
                <xsl:value-of select="/cards/@cards-per-row"/>
            </xsl:when>
            <xsl:otherwise>3</xsl:otherwise>
        </xsl:choose>
    </xsl:variable>
    
    <xsl:template match="/">
        <html lang="en">
            <head>
                <meta charset="UTF-8"/>
                <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
                <title>Card Layout</title>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"/>
            </head>
            <body>
                <div class="container my-5">
                    <xsl:for-each select="cards/card[position() mod $cards-per-row = 1]">
                        <div class="row mb-4">
                            <div class="card-group">
                                <xsl:apply-templates select=". | following-sibling::card[position() &lt; $cards-per-row]"/>
                            </div>
                        </div>
                    </xsl:for-each>
                </div>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="card">
        <div class="card rounded-0">
            <img src="{image}" class="card-img-top rounded-0" alt="Card Image"/>
            <xsl:if test="string-length(normalize-space(title)) > 0 or string-length(normalize-space(text)) > 0">
                <div class="card-body">
                    <xsl:if test="string-length(normalize-space(title)) > 0">
                        <h5 class="card-title"><xsl:value-of select="title"/></h5>
                    </xsl:if>
                    <xsl:if test="string-length(normalize-space(text)) > 0">
                        <p class="card-text"><xsl:value-of select="text"/></p>
                    </xsl:if>
                </div>
            </xsl:if>
            <div class="card-footer text-muted rounded-0">
                <xsl:value-of select="footer"/>
            </div>
        </div>
    </xsl:template>
</xsl:stylesheet> 