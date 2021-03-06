<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns="http://www.w3.org/1999/xhtml"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0" exclude-result-prefixes="xs" version="2.0">
    <xsl:output method="xhtml" encoding="utf-8" doctype-system="about:legacy-compat"
        omit-xml-declaration="yes"/>

    <xsl:template match="/">
        <!--2016-10-23 ebb: First, when creating HTML from XML, we have to start with a template match on the document node, so we convert the root element and everything in a *one-to-one relationship with the root*. This is where we map the outer/higher level of the document organization. -->
        <html>
            <head>
                <title>Info Tables about Digital Mitford Site Index People and Organizations</title>
            </head>
            <body>
                <h1>Info about the Digital Mitford Site Index ListPersons</h1>

                <table>
                    <tr>
                        <th>ListPerson Type</th>
                        <th>Number of Males</th>
                        <th>Number of Females</th>
                        <th>Number Unmarked</th>
                        <th>Total Number of Persons</th>
                    </tr>
                    <xsl:apply-templates select="descendant::listPerson"/>
                </table>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="listPerson">
        <!-- RJP: This match processes the data we selected in the apply-template selection in our source node match. -->
        <tr>
            <td>
                <xsl:apply-templates select="@type"/>
            </td>
            <td>
                <xsl:value-of select="count(person[@sex = '1'])"/>
            </td>
            <td>
                <xsl:value-of select="count(child::person[@sex = '2'])"/>
            </td>
            <td>
                <xsl:value-of select="count(child::person[not(@sex)])"/>
            </td>
            <td>
                <xsl:value-of select="count(child::person)"/>
            </td>
        </tr>
    </xsl:template>

</xsl:stylesheet>
