<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:str="http://exslt.org/strings"
    xmlns:gco="http://www.isotc211.org/2005/gco" 
    xmlns:gmd="http://www.isotc211.org/2005/gmd"
    xmlns:gml="http://www.opengis.net/gml"
    xmlns:mmd="http://www.met.no/schema/mmd"
    xmlns:date="http://exslt.org/dates-and-times"
    version="1.0">
    <xsl:include href="mmdv2-to-mmdv3.xsl" />
    <xsl:output method="xml" encoding="UTF-8" indent="yes" />
        <!--xsl:template match="mmd:dataset_citation">
    
        <xsl:element name="mmd:dataset_citation">
           <xsl:element name="mmd:author">
           <xsl:choose>
              <xsl:when test="mmd:author">
	         <xsl:value-of select="mmd:author"/>
             </xsl:when>
             <xsl:otherwise>
	         <xsl:value-of select="mmd:dataset_creator"/>
             </xsl:otherwise>
           </xsl:choose>
           </xsl:element>
           <xsl:element name="mmd:title">
           <xsl:choose>
              <xsl:when test="mmd:title">
	         <xsl:value-of select="mmd:title"/>
             </xsl:when>
             <xsl:otherwise>
	         <xsl:value-of select="mmd:dataset_title"/>
             </xsl:otherwise>
           </xsl:choose>
           </xsl:element>
           <xsl:element name="mmd:series">
	      <xsl:value-of select="mmd:dataset_series_name"/>
           </xsl:element>
           <xsl:element name="mmd:publication_date">
           <xsl:choose>
              <xsl:when test="mmd:publication_date">
	         <xsl:value-of select="mmd:publication_date"/>
             </xsl:when>
             <xsl:otherwise>
	         <xsl:value-of select="mmd:dataset_release_date"/>
             </xsl:otherwise>
           </xsl:choose>
           </xsl:element>
           <xsl:element name="mmd:publication_place">
	      <xsl:value-of select="mmd:publication_place"/>
           </xsl:element>
           <xsl:element name="mmd:publisher">
           <xsl:choose>
              <xsl:when test="mmd:publisher">
	         <xsl:value-of select="mmd:publisher"/>
             </xsl:when>
             <xsl:otherwise>
	         <xsl:value-of select="mmd:dataset_publisher"/>
             </xsl:otherwise>
           </xsl:choose>
           </xsl:element>
           <xsl:element name="mmd:edition">
	      <xsl:value-of select="mmd:version"/>
           </xsl:element>
           <xsl:element name="mmd:issue">
	      <xsl:value-of select="mmd:issue_identification"/>
           </xsl:element>
           <xsl:element name="mmd:other">
	      <xsl:value-of select="mmd:other_citation_details"/>
           </xsl:element>
           <xsl:element name="mmd:doi">
           <xsl:choose>
              <xsl:when test="mmd:doi">
	         <xsl:value-of select="mmd:doi"/>
             </xsl:when>
             <xsl:otherwise>
	         <xsl:value-of select="mmd:dataset_doi"/>
             </xsl:otherwise>
           </xsl:choose>
           </xsl:element>
           <xsl:element name="mmd:url">
	      <xsl:value-of select="mmd:online_resource"/>
           </xsl:element>
        </xsl:element>
        
        </xsl:template-->
    
        <xsl:template match="mmd:collection">
           <xsl:element name="mmd:collection">
              <xsl:value-of select="str:replace(str:replace(., '_', ''), ' ', '')" />
           </xsl:element>
        </xsl:template>


        <xsl:template match="mmd:last_metadata_update">
          <xsl:choose>
	  <xsl:when test="*">
          <xsl:element name="mmd:last_metadata_update">
             <xsl:copy-of select="mmd:update"/>
             <xsl:element name="mmd:update">
                <xsl:element name="mmd:datetime">
                   <xsl:value-of select="concat(substring-before(date:date-time(), '+'),'Z')"/>
                </xsl:element>
                <xsl:element name="mmd:type">
                   <xsl:text>Minor modification</xsl:text>
                </xsl:element>
                <xsl:element name="mmd:note">
                   <xsl:text>Change version of metadata standard to MMD v3</xsl:text>
                </xsl:element>
             </xsl:element>
          </xsl:element>
          </xsl:when>
	  <xsl:otherwise>
          <xsl:element name="mmd:last_metadata_update">
          <xsl:element name="mmd:update">
            <xsl:element name="mmd:datetime">
                <xsl:value-of select="concat(substring-before(date:date-time(), '+'),'Z')"/>
            </xsl:element>
             <xsl:element name="mmd:type">
                <xsl:text>Minor modification</xsl:text>
             </xsl:element>
             <xsl:element name="mmd:note">
                <xsl:text>Change version of metadata standard to MMD v3</xsl:text>
             </xsl:element>
          </xsl:element>
          </xsl:element>
          </xsl:otherwise>
          </xsl:choose>
        </xsl:template>

	<!--Custom translation of mmd-v2 entries that do not follow vocabularies-->
        <xsl:template match="mmd:access_constraint">
           <xsl:element name="mmd:access_constraint">
           <xsl:choose>
              <xsl:when test=". = 'Free'">
	         <xsl:text>Open</xsl:text>
              </xsl:when>
              <xsl:when test=". = 'unrestricted'">
	         <xsl:text>Open</xsl:text>
              </xsl:when>
              <xsl:when test=". = 'Restricted to Damocles'">
	         <xsl:text>Open</xsl:text>
              </xsl:when>
              <xsl:when test=". = 'Restricted to IPY community'">
	         <xsl:text>Open</xsl:text>
              </xsl:when>
              <xsl:when test=". = 'Data restriction: for DAMOCLES partners only'">
	         <xsl:text>Open</xsl:text>
              </xsl:when>
              <xsl:when test=". = 'Restricted to iAOOS-Norway'">
	         <xsl:text>Open</xsl:text>
              </xsl:when>
              <xsl:when test=". = 'Restricted to IPY'">
	         <xsl:text>Open</xsl:text>
              </xsl:when>
              <xsl:when test=". = 'The ECCC-CAPS Arctic supersite dataset is freely distributed for research purposes. Publications and use of the ECCC-CAPS supersite dataset should be accompanied by an acknowledgement to the modeling team (RPN) at the Meteorological Research Division of Environment and Climate Change Canada.'">
	         <xsl:text>Open</xsl:text>
              </xsl:when>
              <xsl:otherwise>
                 <xsl:value-of select="normalize-space(.)" />
              </xsl:otherwise>
           </xsl:choose>
           </xsl:element>
        </xsl:template>

	<!--Custom translation of mmd-v2 entries that do not follow vocabularies-->
        <xsl:template match="mmd:use_constraint">
	      <xsl:choose>
              <xsl:when test=". != 'Public domain' and . != 'Attribution' and . !='Share-alike' and . != 'Noncommercial'">
		      <xsl:apply-templates select="." mode="custom"/>
              </xsl:when>
	      <xsl:otherwise>
		      <xsl:apply-templates select="." mode="voc"/>
              </xsl:otherwise>
              </xsl:choose>
        </xsl:template>

        <xsl:template match="mmd:use_constraint" mode="custom">
              <xsl:if test=". = 'https://www.met.no/en/free-meteorological-data/Licensing-and-crediting'">
                 <xsl:element name="mmd:use_constraint">
                 <xsl:element name="mmd:identifier">
                    <xsl:text>CC-BY-4.0</xsl:text>
                 </xsl:element>
                 <xsl:element name="mmd:resource">
                    <xsl:text>http://spdx.org/licenses/CC-BY-4.0</xsl:text>
                 </xsl:element>
                 </xsl:element>
              </xsl:if>
              <xsl:if test=". = 'Something'">
                 <xsl:element name="mmd:use_constraint">
                 <xsl:element name="mmd:identifier">
                    <xsl:text>CC-BY-4.0</xsl:text>
                 </xsl:element>
                 <xsl:element name="mmd:resource">
                    <xsl:text>http://spdx.org/licenses/CC-BY-4.0</xsl:text>
                 </xsl:element>
                 </xsl:element>
              </xsl:if>
        </xsl:template>

        <xsl:template match="mmd:use_constraint" mode="voc">
        <xsl:element name="mmd:use_constraint">
              <xsl:if test=". = 'Public domain'">
                 <xsl:element name="mmd:identifier">
                    <xsl:text>CC0-1.0</xsl:text>
                 </xsl:element>
                 <xsl:element name="mmd:resource">
                    <xsl:text>http://spdx.org/licenses/CC0-1.0</xsl:text>
                 </xsl:element>
              </xsl:if>
              <xsl:if test=".  ='Attribution'">
                 <xsl:element name="mmd:identifier">
                    <xsl:text>CC-BY-4.0</xsl:text>
                 </xsl:element>
                 <xsl:element name="mmd:resource">
                    <xsl:text>http://spdx.org/licenses/CC-BY-4.0</xsl:text>
                 </xsl:element>
              </xsl:if>
              <xsl:if test=". = 'Share-alike'">
                 <xsl:element name="mmd:identifier">
                    <xsl:text>CC-BY-SA-4.0</xsl:text>
                 </xsl:element>
                 <xsl:element name="mmd:resource">
                    <xsl:text>http://spdx.org/licenses/CC-BY-SA-4.0</xsl:text>
                 </xsl:element>
              </xsl:if>
              <xsl:if test=".='Noncommercial'">
                 <xsl:element name="mmd:identifier">
                    <xsl:text>CC-BY-NC-4.0</xsl:text>
                 </xsl:element>
                 <xsl:element name="mmd:resource">
                    <xsl:text>http://spdx.org/licenses/CC-BY-NC-4.0</xsl:text>
                 </xsl:element>
              </xsl:if>
            </xsl:element>
        </xsl:template>

	<!--Custom translation of mmd-v2 entries that do not follow vocabularies-->
        <xsl:template match="mmd:activity_type">
           <xsl:element name="mmd:activity_type">
           <xsl:choose>
              <xsl:when test=". = 'In Situ Ocean moving station (Float)'">
	         <xsl:text>In Situ Ocean moving station</xsl:text>
              </xsl:when>
              <xsl:when test=". = 'Float'">
	         <xsl:text>In Situ Ocean moving station</xsl:text>
              </xsl:when>
              <xsl:when test=". = 'In Situ Ocean fixed station (Moored Instrument)'">
	         <xsl:text>In Situ Ocean fixed station</xsl:text>
              </xsl:when>
              <xsl:when test=". = 'Moored Instrument'">
	         <xsl:text>In Situ Ocean fixed station</xsl:text>
              </xsl:when>
              <xsl:when test=". = 'In Situ Land-based station (Land Station)(Field Experiment)'">
	         <xsl:text>In Situ Land-based station</xsl:text>
              </xsl:when>
              <xsl:when test=". = 'In Situ Ice-based station (Ice Station) (Field Experiment)'">
	         <xsl:text>In Situ Ice-based station</xsl:text>
              </xsl:when>
              <xsl:when test=". = 'Ice Station'">
	         <xsl:text>In Situ Ice-based station</xsl:text>
              </xsl:when>
              <xsl:when test=". = 'Interview/Questionnaire (Questionnaire)'">
	         <xsl:text>Interview/Questionnaire</xsl:text>
              </xsl:when>
              <xsl:when test=". = 'Maps/Charts/Photographs (Maps) (Charts) (Photographs)'">
	         <xsl:text>Maps/Charts/Photographs</xsl:text>
             </xsl:when>
              <xsl:when test=". = 'Model run'">
	         <xsl:text>Numerical Simulation</xsl:text>
              </xsl:when>
              <xsl:when test=". = 'Space borne instrument'">
	         <xsl:text>Space Borne Instrument</xsl:text>
             </xsl:when>
              <xsl:when test=". = 'Space borne instrument, Analysis'">
	         <xsl:text>Space Borne Instrument</xsl:text>
             </xsl:when>
              <xsl:when test=". = 'operational model cy42_op2 long cut-off'">
	         <xsl:text>Numerical Simulation</xsl:text>
             </xsl:when>
              <xsl:when test=". = 'ICON svn://xceh.dwd.de/for0adm/SVN_icon/tags/icon-2.5.0-nwp1@134'">
	         <xsl:text>Numerical Simulation</xsl:text>
             </xsl:when>
              <xsl:when test=". = 'Canadian Arctic Prediction System'">
	         <xsl:text>Numerical Simulation</xsl:text>
             </xsl:when>
              <xsl:when test=". = 'ECMWF HIRES Operational forecast (Cy43r3)'">
	         <xsl:text>Numerical Simulation</xsl:text>
             </xsl:when>
              <xsl:when test=". = 'CLMcom-CCLM4-8-17'">
	         <xsl:text>Numerical Simulation</xsl:text>
             </xsl:when>
              <xsl:when test=". = 'ARPEGE operational model cy42_op2 long cut-off'">
	         <xsl:text>Numerical Simulation</xsl:text>
             </xsl:when>
              <xsl:when test=". = 'Land station'">
	         <xsl:text>In Situ Land-based station</xsl:text>
             </xsl:when>
              <xsl:when test=". = 'In Situ Ship-based station (Cruise)'">
	         <xsl:text>In Situ Ship-based station</xsl:text>
             </xsl:when>
              <xsl:when test=". = 'Cruise'">
	         <xsl:text>In Situ Ship-based station</xsl:text>
             </xsl:when>
              <xsl:when test=". = 'Climate indicator'">
	         <xsl:text>Climate Indicator</xsl:text>
             </xsl:when>

             <xsl:otherwise>
                 <xsl:value-of select="." />
             </xsl:otherwise>
           </xsl:choose>
           </xsl:element>
        </xsl:template>

        <xsl:template match="mmd:iso_topic_category">
           <xsl:element name="mmd:iso_topic_category">
           <xsl:choose>
              <xsl:when test=". = 'Oceans'">
	         <xsl:text>oceans</xsl:text>
             </xsl:when>
             <xsl:otherwise>
                 <xsl:value-of select="." />
             </xsl:otherwise>
           </xsl:choose>
           </xsl:element>
        </xsl:template>

        <xsl:template match="mmd:dataset_production_status">
           <xsl:element name="mmd:dataset_production_status">
              <xsl:value-of select="normalize-space(.)" />
           </xsl:element>
        </xsl:template>


</xsl:stylesheet>
