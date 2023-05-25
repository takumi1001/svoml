<?xml version="1.0"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="/"> 
        <xsl:apply-templates/>
    </xsl:template> 

    <xsl:template match="svoml"> 
        <html lang="en">
            <head>
                <meta charset="utf-8"></meta>
                <link href="https://takumi1001.github.io/svoml/xslt/svoml.css" rel="stylesheet"> </link>
                <title>SVOML XSLT</title>
            </head>
            <body>
                <xsl:apply-templates/>       
            </body>
        </html>
    </xsl:template>

    <xsl:template match="header">
        <header>
            <xsl:value-of select="."/>
        </header>            
    </xsl:template>

    <xsl:template match="g">
        <span class="group">
            <xsl:if test="./@id">
                <xsl:attribute name="id">
                    <xsl:value-of select="./@id"></xsl:value-of>
                </xsl:attribute>
            </xsl:if>
            <xsl:apply-templates/> 
        </span>           
    </xsl:template>

    <xsl:template match="s">
        <span class="subject group">
            <xsl:if test="./@id">
                <xsl:attribute name="id">
                    <xsl:value-of select="./@id"></xsl:value-of>
                </xsl:attribute>
            </xsl:if>
            <xsl:apply-templates/> 
        </span>           
    </xsl:template>

    <xsl:template match="v">
        <span class="verb group">
            <xsl:if test="./@id">
                <xsl:attribute name="id">
                    <xsl:value-of select="./@id"></xsl:value-of>
                </xsl:attribute>
            </xsl:if>
            <xsl:apply-templates/> 
        </span>           
    </xsl:template>

    <xsl:template match="o">
        <span class="object group">
            <xsl:if test="./@id">
                <xsl:attribute name="id">
                    <xsl:value-of select="./@id"></xsl:value-of>
                </xsl:attribute>
            </xsl:if>
            <xsl:apply-templates/> 
        </span>           
    </xsl:template>

    <xsl:template match="c">
        <span class="complement group">
            <xsl:if test="./@id">
                <xsl:attribute name="id">
                    <xsl:value-of select="./@id"></xsl:value-of>
                </xsl:attribute>
            </xsl:if>
            <xsl:apply-templates/> 
        </span>           
    </xsl:template>

    <xsl:template match="h">
        <span class="hidden-group">
            <xsl:if test="./@id">
                <xsl:attribute name="id">
                    <xsl:value-of select="./@id"></xsl:value-of>
                </xsl:attribute>
            </xsl:if>
            <xsl:apply-templates/> 
        </span>           
    </xsl:template>

    <xsl:template match="t">
        <p class="text">
            <xsl:apply-templates/> 
        </p>           
    </xsl:template>

    <xsl:template match="footer">
        <footer>
            <xsl:value-of select="."/>
        </footer>            
    </xsl:template>

    <xsl:template match="arrows">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/leader-line/1.0.3/leader-line.min.js" integrity="sha512-aFBNsI3+D6ObLLtyKwdZPZzDbcCC6+Bh+2UNV8HC0R95BpcBT+dmmZ5NMpJi/Ic8uO0W7FGcg33IfuHg+7Ryew==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <script>
            const di_kargs =  {
                path: "grid",
                startSocket: 'top',
                endSocket: 'top',
                color: 'rgba(30, 130, 250, 0.5)'
            };
            const bi_kargs =  {
                path: "grid",
                startSocket: 'top',
                endSocket: 'top',
                color: 'rgba(30, 130, 250, 0.5)',
                startPlug: 'arrow1'
            };
            const un_kargs =  {
                path: "grid",
                startSocket: 'top',
                endSocket: 'top',
                color: 'rgba(30, 130, 250, 0.5)',
                startPlug: 'disc',
                endPlug: 'disc',
            };
            <xsl:apply-templates/>
        </script>            
    </xsl:template>
                    
    <xsl:template match="di">
        new LeaderLine(document.getElementById('<xsl:value-of select="./@start"></xsl:value-of>'), 
                       document.getElementById('<xsl:value-of select="./@end"></xsl:value-of>'),
                       di_kargs);
    </xsl:template>

    <xsl:template match="bi">
        new LeaderLine(document.getElementById('<xsl:value-of select="./@start"></xsl:value-of>'), 
                       document.getElementById('<xsl:value-of select="./@end"></xsl:value-of>'),
                       bi_kargs);
    </xsl:template>

    <xsl:template match="un">
        new LeaderLine(document.getElementById('<xsl:value-of select="./@start"></xsl:value-of>'), 
                       document.getElementById('<xsl:value-of select="./@end"></xsl:value-of>'),
                       un_kargs);
    </xsl:template>

</xsl:stylesheet>