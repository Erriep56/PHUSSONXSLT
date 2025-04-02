<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xpath-default-namespace="http://www.tei-c.org/ns/1.0"
    version="2.0">

    <!-- VARIABLES GLOBALES -->
    <xsl:variable name="head"> 
        <!-- Variable pour le header avec le css -->
        <head>
            <meta charset="utf-8"/>
            <meta name="viewport" content="width=device-width, initial-scale=1"/>
            <title>Manuscrits de Mariette - Artistes vénitiens</title>
            <style>
                body {
                font-family: 'Poppins', sans-serif;
                line-height: 1.8;
                margin: 0;
                padding: 20px;
                max-width: 1200px;
                margin: 0 auto;
                color: #2c3e50;
                background-color: #f4f6f9;
                }
                
                h1, h2, h3 {
                color: #34495e;
                }
                
                #navbar {
                background-color: #ffffff;
                padding: 15px 0;
                margin-bottom: 20px;
                border-bottom: 2px solid #e0e0e0;
                box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.05);
                } 
                
                #navbar > ul {
                padding-left: 0;
                margin: 0;
                text-align: center;
                }
                
                #navbar > ul > li {
                display: inline-block;
                list-style: none;
                margin: 0 20px;
                }
                
                #navbar > ul > li > a {
                text-decoration: none;
                color: #2c3e50;
                font-weight: 600;
                padding: 8px 12px;
                transition: color 0.3s ease-in-out;
                }
                
                #navbar > ul > li > a:hover {
                color: #007bff;
                border-bottom: 2px solid #007bff;
                } /* un hover pour faire joli */
                
                h1.main-title { /* titre principal au dessus de la nav bar */
                text-align: center;
                color: #007bff;
                margin-top: 20px;
                margin-bottom: 10px;
                font-size: 2.2em;
                }
                
                h2.subtitle { /* titre secondaire au dessus de la nav bar */
                text-align: center;
                color: #555;
                margin-top: -5px;
                margin-bottom: 20px;
                font-size: 1.4em;
                font-weight: 400;
                }
                
                .artwork-item {
                margin-bottom: 25px;
                padding-bottom: 15px;
                border-bottom: 1px solid #ddd;
                }
                
                .artwork-label { /* numéro */
                font-weight: bold;
                color: #007bff;
                margin-right: 10px;
                }
                
                .person { /* différencier les personnes des lieux */
                color: #d81b60;
                }
                
                .place { /* différencier les lieux du texte */
                color: #43a047;
                }
                
                .role { 
                font-style: italic;
                color: #7f8c8d;
                }
                
                .note { /* mettre en valeur les notes */
                font-size: 0.95em;
                color: #555;
                margin-left: 20px;
                padding: 10px;
                background-color: #fdfdfd;
                border-left: 4px solid #007bff;
                border-radius: 4px;
                }
                
                .index-category { /* ajouter des espaces sous les catégories de l'index */
                margin-bottom: 35px;
                }
                
                .index-list {
                list-style-type: none;
                padding-left: 0;
                }
                
                .index-list li {
                margin-bottom: 10px;
                }
                
                .index-link { /* mettre les liens en couleur */
                text-decoration: none;
                color: #007bff;
                font-weight: 500;
                transition: text-decoration 0.2s ease-in-out;
                }
                
                .index-link:hover {
                text-decoration: underline;
                }
                
                .dimensions {
                color: #8d6e63;
                font-size: 0.95em;
                }
                
                .facsimile-container { /* pour les images */
                display: flex;
                margin-bottom: 35px;
                border-bottom: 1px solid #ddd;
                padding-bottom: 25px;
                }
                
                .facsimile-image {
                flex: 0 0 320px;
                margin-right: 25px;
                border-radius: 5px;
                overflow: hidden;
                }
                
                .facsimile-image img {
                max-width: 100%;
                border-radius: 5px;
                border: 1px solid #ccc;
                }
                
                .facsimile-content {
                flex: 1;
                }
                
            </style>
        </head>
    </xsl:variable>

    <xsl:variable name="navbar">
        <div id="navbar">
            <ul>
                <!-- navbar -->
                <h1 class="main-title"><xsl:value-of select="//titleStmt/title[1]"/></h1>
                <h2 class="subtitle"><xsl:value-of select="//titleStmt/title[2]"/></h2>
                <li><a href="home.html">Accueil</a></li>
                <li><a href="artistes.html">Artistes</a></li>
                <li><a href="peintre_veronese.html">Paul Véronèse</a></li>
                <li><a href="peintre_tintoret.html">Le Tintoret</a></li>
                <li><a href="index.html">Index</a></li>
            </ul>
        </div>
    </xsl:variable>

    <xsl:variable name="footer">
        <footer>
            <!-- footer en bas -->
            <hr/>
            <p>Edition numérique par <xsl:value-of select="//publicationStmt/publisher"/>, <xsl:value-of select="//publicationStmt/date"/></p>
        </footer>
    </xsl:variable>
    
    <!-- appel des différents templates -->
    <xsl:template match="/">
        <xsl:call-template name="home"/>
        <xsl:call-template name="artistes"/>
        <xsl:call-template name="peintre-veronese"/>
        <xsl:call-template name="peintre-tintoret"/>
        <xsl:call-template name="index"/>
    </xsl:template>

    <!-- page d'accueil -->
    <xsl:template name="home">
        <xsl:result-document href="out/home.html" method="html" indent="yes">
            <html>
                <xsl:copy-of select="$head"/>
                <body>
                    <xsl:copy-of select="$navbar"/>
                    <div class="main-content">
                        <h1>Manuscrits de Pierre-Jean Mariette - Artistes vénitiens</h1>
                        <div class="manuscript-info">
                            <!-- copier le texte du projectDesc pour présenter le projet -->
                            <p><xsl:value-of select="//projectDesc/p[1]"/></p>
                            <h3>Le manuscrit</h3>
                            <p><xsl:value-of select="//projectDesc/p[2]"/></p>
                            <a href="{//projectDesc/p[3]/ref/@target}"><xsl:value-of select="//projectDesc/p[3]/ref"/></a>
                            <h3>Le projet</h3>
                            <p><xsl:value-of select="//projectDesc/p[4]"/></p>
                            <h3>Bibliographie</h3>
                            <ul class="bibliography-list">
                                <!-- récupère la bibliographie -->
                                <xsl:for-each select="//listBibl/bibl">
                                    <li id="{@xml:id}">
                                        <xsl:apply-templates select="."/>
                                    </li>
                                </xsl:for-each>
                            </ul>
                        </div>
                    </div>
                    <xsl:copy-of select="$footer"/>
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>

    <!-- pages artistes -->
    <xsl:template name="artistes">
        <xsl:result-document href="out/artistes.html" method="html" indent="yes">
            <html>
                <xsl:copy-of select="$head"/>
                <body>
                    <xsl:copy-of select="$navbar"/>
                    <div class="main-content">
                        <h1>Artistes vénitiens</h1>
                        <h2>Liste des artistes</h2>
                        <ul>
                            <li>
                                <h3><a href="peintre_veronese.html">Paul Caliari dit Véronèse</a></h3>
                            </li>
                            <li>
                                <h3><a href="peintre_tintoret.html">Jacopo Tintoretto dit Le Tintoret</a></h3>
                            </li>
                        </ul>
                    </div>
                    <xsl:copy-of select="$footer"/>
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>

    <!-- template de Veronese -->
    <xsl:template name="peintre-veronese">
        <xsl:result-document href="out/peintre_veronese.html" method="html" indent="yes">
            <html>
                <xsl:copy-of select="$head"/>
                <body>
                    <xsl:copy-of select="$navbar"/>
                    <div class="main-content">
                        <!-- conteneur principal -->
                        <h1><xsl:value-of select="//div[@xml:id='section_veronese']/head/title[2]"/></h1>
                        
                        <!-- selectionne tout ce qui vient de la div veronese -->
                        <xsl:variable name="veronese-div" select="//div[@xml:id='section_veronese']"/>
                        
                        <!-- vérifie qu'il y a un pb s'il y a plusieurs pages -->
                        <xsl:choose>
                            <xsl:when test="$veronese-div//pb">
                                <!-- Process page by page -->
                                <xsl:for-each select="$veronese-div//pb">
                                    <!-- récupère la variable de la page -->
                                    <xsl:variable name="page_num" select="@n"/>
                                    <xsl:variable name="page_index" select="position()"/>
                                    
                                    <!-- place l'image à gauche -->
                                    <div class="facsimile-container">
                                        <div class="facsimile-image">
                                            <img src="../facsimile/veronese{$page_index}.jpeg" alt="Fac-similé page {$page_num}"/>
                                        </div>
                                        
                                        <!-- donne la page du fac similé -->
                                        <div class="facsimile-content">
                                            <h2>Fac-similé p. <xsl:value-of select="$page_num"/></h2>
                                            <p>Source: <a href="{@facs}" target="_blank">Gallica</a></p>
                                            <div class="artworks">
                                                <!-- applique les templates de la liste -->
                                                <xsl:apply-templates select="$veronese-div//list/item"/>
                                            </div>
                                        </div>
                                    </div>
                                </xsl:for-each>
                            </xsl:when>
                            <xsl:otherwise>
                                <!-- au cas où il n'y a pas de pn, montre le contenu -->
                                <div class="artworks">
                                    <xsl:apply-templates select="$veronese-div//list/item"/>
                                </div>
                            </xsl:otherwise>
                        </xsl:choose>
                    </div>
                    <xsl:copy-of select="$footer"/>
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>
    
    <xsl:template name="peintre-tintoret">
        <xsl:result-document href="out/peintre_tintoret.html" method="html" indent="yes">
            <html>
                <xsl:copy-of select="$head"/>
                <body>
                    <xsl:copy-of select="$navbar"/>
                    <div class="main-content">
                        <h1><xsl:value-of select="//div[@xml:id='section_tintoret']/head/title[2]"/></h1>
                        
                        <!-- ajout d'une variable pour faciliter le travail -->
                        <xsl:variable name="tintoret-div" select="//div[@xml:id='section_tintoret']"/>
                        
                        <!-- fait attention aux pb comme pour veronese -->
                        <xsl:choose>
                            <xsl:when test="$tintoret-div//pb">
                                <!-- for each pour toutes les pages, garde les numéros de pages en mémoire -->
                                <xsl:for-each select="$tintoret-div//pb">
                                    <xsl:variable name="page_num" select="@n"/>
                                    <xsl:variable name="page_index" select="position()"/>
                                    <div class="facsimile-container">
                                        <div class="facsimile-image">
                                            <img src="../facsimile/tintoret{$page_index}.jpeg" alt="Fac-similé page {$page_num}"/>
                                        </div>
                                        <div class="facsimile-content">
                                            <h2>Fac-similé p. <xsl:value-of select="$page_num"/></h2>
                                            <p>Source: <a href="{@facs}" target="_blank">Gallica</a></p>
                                            <div class="artworks">
                                                <!-- détaaille le texte -->
                                                <xsl:apply-templates select="$tintoret-div//list/item"/>
                                            </div>
                                        </div>
                                    </div>
                                </xsl:for-each>
                            </xsl:when>
                            <xsl:otherwise>
                                <!-- comme pour la section précédente, montre le contenu si pas de page break -->
                                <div class="artworks">
                                    <xsl:apply-templates select="$tintoret-div//list/item"/>
                                </div>
                            </xsl:otherwise>
                        </xsl:choose>
                    </div>
                    <xsl:copy-of select="$footer"/>
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>

    <!-- template pour les gravures cités avec un numéro -->
    <xsl:template match="item[@n]">
        <div class="artwork-item">
            <span class="artwork-label"><xsl:value-of select="preceding-sibling::label[1]"/></span>
            <xsl:apply-templates/>
            <xsl:if test="not(list)">
                <br/>
            </xsl:if>
        </div>
    </xsl:template>

    <!-- template pour les gravures cités sans numéro -->
    <xsl:template match="item[not(@n)]">
        <div>
            <xsl:apply-templates/>
        </div>
    </xsl:template>

    <!-- template pour les persName pour les afficher en couleurs -->
    <xsl:template match="persName">
        <span class="person">
            <xsl:value-of select="."/>
            <xsl:if test="@role">
                <span class="role"> (<xsl:value-of select="@role"/>)</span>
            </xsl:if>
        </span>
    </xsl:template>

    <!-- template pour les placeName pour les afficher en couleurs -->
    <xsl:template match="placeName">
        <span class="place"><xsl:value-of select="."/></span>
    </xsl:template>

    <!-- template pour les notes -->
    <xsl:template match="note">
        <div class="note">
            <xsl:apply-templates/>
        </div>
    </xsl:template>

    <!-- templates pour préciser les dimensions -->
    <xsl:template match="dimensions">
        <span class="dimensions">
            <xsl:text>Dimensions: </xsl:text>
            <xsl:value-of select="height"/>
            <xsl:if test="width">
                <xsl:text> x </xsl:text>
                <xsl:value-of select="width"/>
            </xsl:if>
        </span>
    </xsl:template>

    <!-- Début du template de l'index -->
    <xsl:template name="index">
        <xsl:result-document href="out/index.html" method="html" indent="yes">
            <html>
                <xsl:copy-of select="$head"/>
                <body>
                    <xsl:copy-of select="$navbar"/>
                    <div class="main-content">
                        <h1>Index des personnes et des lieux</h1>
                        <!-- l'index est divisé selon les rôles des personnes -->
                        
                        <!-- Index des graveurs -->
                        <div class="index-category">
                            <h2>Graveurs</h2>
                            <ul class="index-list">
                                <!-- récupère les personnes de la liste du header -->
                                <xsl:for-each select="//listPerson/person">
                                    <xsl:variable name="id" select="@xml:id"/>
                                    
                                    <!-- cherche ceux qui on le même id -->
                                    <xsl:if test="//persName[@role='graveur' and @ref=concat('#', $id)]">
                                        
                                        <!-- ajoute à la liste -->
                                        <li>
                                            <xsl:value-of select="persName"/>
                                            <xsl:text> - Occurrences : </xsl:text>
                                            <!-- Groupe les occurrences par peintre pour éliminer les doublons -->
                                            <xsl:for-each-group select="//persName[@role='graveur' and @ref=concat('#', $id)]" group-by="ancestor::div/@xml:id">
                                                <xsl:call-template name="generate-link">
                                                    <xsl:with-param name="section_id" select="current-grouping-key()"/>
                                                </xsl:call-template>
                                                <xsl:if test="position() != last()">, </xsl:if>
                                            </xsl:for-each-group>
                                        </li>
                                    </xsl:if>
                                </xsl:for-each>
                            </ul>
                        </div>
                        
                        <!-- Index des collectionneurs -->
                        <div class="index-category">
                            <h2>Collectionneurs et propriétaires</h2>
                            <ul class="index-list">
                                <xsl:for-each select="//listPerson/person">
                                    <xsl:variable name="id" select="@xml:id"/>
                                    <xsl:if test="//persName[@role='collectionneur' and @ref=concat('#', $id)]">
                                        
                                        <li>
                                            <xsl:value-of select="persName"/>
                                            <xsl:text> - Œuvres possédées : </xsl:text>
                                            <xsl:for-each-group select="//persName[@role='collectionneur' and @ref=concat('#', $id)]" group-by="ancestor::div/@xml:id">
                                                <xsl:call-template name="generate-link">
                                                    <xsl:with-param name="section_id" select="current-grouping-key()"/>
                                                </xsl:call-template>
                                                <xsl:if test="position() != last()">, </xsl:if>
                                            </xsl:for-each-group>
                                        </li>
                                    </xsl:if>
                                </xsl:for-each>
                            </ul>
                        </div>
                        
                        <!-- Index des auteurs -->
                        <div class="index-category">
                            <h2>Auteurs du modèle</h2>
                            <ul class="index-list">
                                <xsl:for-each select="//listPerson/person">
                                    <xsl:variable name="id" select="@xml:id"/>
                                    <xsl:if test="//persName[@role='auteur' and @ref=concat('#', $id)]">
                                        
                                        <li>
                                            <xsl:value-of select="persName"/>
                                            <xsl:text> - Œuvres : </xsl:text>
                                            <xsl:for-each-group select="//persName[@role='auteur' and @ref=concat('#', $id)]" group-by="ancestor::div/@xml:id">
                                                <xsl:call-template name="generate-link">
                                                    <xsl:with-param name="section_id" select="current-grouping-key()"/>
                                                </xsl:call-template>
                                                <xsl:if test="position() != last()">, </xsl:if>
                                            </xsl:for-each-group>
                                        </li>
                                    </xsl:if>
                                </xsl:for-each>
                            </ul>
                        </div>
                        
                        <!-- Index des écrivains -->
                        <div class="index-category">
                            <h2>Écrivains et rédacteurs de sources textuelles</h2>
                            <ul class="index-list">
                                <xsl:for-each select="//listPerson/person">
                                    <xsl:variable name="id" select="@xml:id"/>
                                    <xsl:if test="//persName[@role='écrivain' and @ref=concat('#', $id)]">
                                        
                                        <li>
                                            <xsl:value-of select="persName"/>
                                            <xsl:text> - Références : </xsl:text>
                                            <xsl:for-each-group select="//persName[@role='écrivain' and @ref=concat('#', $id)]" group-by="ancestor::div/@xml:id">
                                                <xsl:call-template name="generate-link">
                                                    <xsl:with-param name="section_id" select="current-grouping-key()"/>
                                                </xsl:call-template>
                                                <xsl:if test="position() != last()">, </xsl:if>
                                            </xsl:for-each-group>
                                        </li>
                                    </xsl:if>
                                </xsl:for-each>
                            </ul>
                        </div>
                        
                        <!-- Index des personnes représentées -->
                        <div class="index-category">
                            <h2>Personnes représentées</h2>
                            <ul class="index-list">
                                <xsl:for-each select="//listPerson/person">
                                    <xsl:variable name="id" select="@xml:id"/>
                                    <xsl:if test="//persName[@role='représenté' and @ref=concat('#', $id)]">
                                        
                                        <li>
                                            <xsl:value-of select="persName"/>
                                            <xsl:text> - Représentations : </xsl:text>
                                            <xsl:for-each-group select="//persName[@role='représenté' and @ref=concat('#', $id)]" group-by="ancestor::div/@xml:id">
                                                <xsl:call-template name="generate-link">
                                                    <xsl:with-param name="section_id" select="current-grouping-key()"/>
                                                </xsl:call-template>
                                                <xsl:if test="position() != last()">, </xsl:if>
                                            </xsl:for-each-group>
                                        </li>
                                    </xsl:if>
                                </xsl:for-each>
                            </ul>
                        </div>
                        
                        <!-- Index des lieux -->
                        <div class="index-category">
                            <h2>Lieux</h2>
                            <ul class="index-list">
                                <xsl:for-each select="//listPlace/place">
                                    <xsl:variable name="id" select="@xml:id"/>
                                    <li>
                                        <xsl:value-of select="placeName"/>
                                        <xsl:text> - Mentions : </xsl:text>
                                        <xsl:for-each-group select="//placeName[@ref=concat('#', $id)]" group-by="ancestor::div/@xml:id">
                                            <xsl:call-template name="generate-link">
                                                <xsl:with-param name="section_id" select="current-grouping-key()"/>
                                            </xsl:call-template>
                                            <xsl:if test="position() != last()">, </xsl:if>
                                        </xsl:for-each-group>
                                    </li>
                                </xsl:for-each>
                            </ul>
                        </div>
                    </div>
                    <xsl:copy-of select="$footer"/>
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>
    
    <!-- template pour générer les liens -->
    <xsl:template name="generate-link">
        <xsl:param name="section_id"/>
        
        <xsl:variable name="peintre">
            <xsl:choose>
                <xsl:when test="$section_id = 'section_veronese'">Paul Véronèse</xsl:when>
                <xsl:when test="$section_id = 'section_tintoret'">Le Tintoret</xsl:when>
                <xsl:otherwise>Artiste inconnu</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        
        <xsl:variable name="lien">
            <xsl:choose>
                <xsl:when test="$section_id = 'section_veronese'">peintre_veronese.html</xsl:when>
                <xsl:when test="$section_id = 'section_tintoret'">peintre_tintoret.html</xsl:when>
                <xsl:otherwise></xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        
        <a class="index-link" href="{$lien}">
            <xsl:value-of select="$peintre"/>
        </a>
    </xsl:template>
</xsl:stylesheet>
