<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math ="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs"
    xmlns="http://www.w3.org/2000/svg">
    
    <xsl:output method="xml" indent="yes"/> 
    
    <!--VARIABLES FOR TOTALS-->
    <xsl:variable name="lotTotal" select="count(//lot)"/>
    <xsl:variable name="occTotal" select="count(//occupant)"/>
    
    <!--IMPORTANT COMMENTS-->
    
    <xsl:template match="/">
        <xsl:comment>TOTALS</xsl:comment>
        <xsl:comment>The total number of lots is: <xsl:value-of select="$lotTotal"/>.</xsl:comment>
        <xsl:comment>The total number of occupants is: <xsl:value-of select="$occTotal"/>.</xsl:comment>
        <xsl:comment>DATA POINTS</xsl:comment>
        <xsl:for-each select="//lot">
            <xsl:comment>There are <xsl:value-of select="count(descendant::occupant)"/> occupants for lot #<xsl:value-of select="@number"/>.</xsl:comment>
        </xsl:for-each>
        <xsl:comment>HOW TO CHART ON THE CIRCLE</xsl:comment>
        <xsl:comment>To make a pie chart, the data has to be proportional to 360, because a circle has 360 degrees.
        1. Find the total number of repeats for each instance, these make up the slices.
        2. Find the total of all the instances you want to display on the chart by adding them together.
        3. Now divide each slice total by the total number of instances to get a percentage.
        4. Multiply this percentage by 2pi (2 * pi) to be know the radian of each slice.
        5.
        6.
        7.
        8. Plot each slice using the radian in the path element and make sure they all fit the circle properly.</xsl:comment>
        
        <!--ANGLE VARIABLES-->
        <!--Check the output window and count the number of times a value appers
            for these individual slices (these are the numbers being divided).-->
            <!--RADIANS-->
        <xsl:variable name="occ2slice" select="(2 div $lotTotal) * (2 * math:pi())"/>
        <xsl:variable name="occ3slice" select="(1 div $lotTotal) * (2 * math:pi())"/>
        <xsl:variable name="occ4slice" select="(2 div $lotTotal) * (2 * math:pi())"/>
        <xsl:variable name="occ5slice" select="(2 div $lotTotal) * (2 * math:pi())"/>
        <xsl:variable name="occ6slice" select="(1 div $lotTotal) * (2 * math:pi())"/>
        <xsl:variable name="occ9slice" select="(1 div $lotTotal) * (2 * math:pi())"/>
        <xsl:comment>CALCULATE THE RADIANS</xsl:comment>
        <xsl:comment>
            1. Radian of occ2slice: <xsl:value-of select="$occ2slice"/>
            2. Radian of occ3slice: <xsl:value-of select="$occ3slice"/>
            3. Radian of occ4slice: <xsl:value-of select="$occ4slice"/>
            4. Radian of occ5slice: <xsl:value-of select="$occ5slice"/>
            5. Radian of occ6slice: <xsl:value-of select="$occ6slice"/>
            6. Radian of occ9slice: <xsl:value-of select="$occ9slice"/>
        </xsl:comment>
            <!--COSINE FOR X-->
        <xsl:variable name="occ2cos" select="math:cos($occ2slice)"/>
        <xsl:variable name="occ3cos" select="math:cos($occ3slice)"/>
        <xsl:variable name="occ4cos" select="math:cos($occ4slice)"/>
        <xsl:variable name="occ5cos" select="math:cos($occ5slice)"/>
        <xsl:variable name="occ6cos" select="math:cos($occ6slice)"/>
        <xsl:variable name="occ9cos" select="math:cos($occ9slice)"/>
        <xsl:comment>CALCULATE THE RADIANS</xsl:comment>
        <xsl:comment>
            1. Cosine of occ2slice: <xsl:value-of select="$occ2cos"/>
            2. Cosine of occ3slice: <xsl:value-of select="$occ3cos"/>
            3. Cosine of occ4slice: <xsl:value-of select="$occ4cos"/>
            4. Cosine of occ5slice: <xsl:value-of select="$occ5cos"/>
            5. Cosine of occ6slice: <xsl:value-of select="$occ6cos"/>
            6. Cosine of occ9slice: <xsl:value-of select="$occ9cos"/>
        </xsl:comment>
            <!--SINE FOR Y-->
        <xsl:variable name="occ2sin" select="math:sin($occ2slice)"/>
        <xsl:variable name="occ3sin" select="math:sin($occ3slice)"/>
        <xsl:variable name="occ4sin" select="math:sin($occ4slice)"/>
        <xsl:variable name="occ5sin" select="math:sin($occ5slice)"/>
        <xsl:variable name="occ6sin" select="math:sin($occ6slice)"/>
        <xsl:variable name="occ9sin" select="math:sin($occ9slice)"/>
        <xsl:comment>CALCULATE THE RADIANS</xsl:comment>
        <xsl:comment>
            1. Sine of occ2slice: <xsl:value-of select="$occ2sin"/>
            2. Sine of occ3slice: <xsl:value-of select="$occ3sin"/>
            3. Sine of occ4slice: <xsl:value-of select="$occ4sin"/>
            4. Sine of occ5slice: <xsl:value-of select="$occ5sin"/>
            5. Sine of occ6slice: <xsl:value-of select="$occ6sin"/>
            6. Sine of occ9slice: <xsl:value-of select="$occ9sin"/>
        </xsl:comment>
        
        <!--SVG OUTPUT VIEW WINDOW-->
        <svg width="100%" height="100%">
            <g transform="translate(350 350)" >
                <circle cx="0" cy="0" r="250" style="stroke:black; stroke-width:3; fill:none"/>
                <path d="M0,0
                    L250,0
                    A250,250 0 0,1 200,100
                    Z"
                    style="stroke:black; stroke-width:3; fill: none"/>
            </g>
        </svg>
    </xsl:template>
    
</xsl:stylesheet>