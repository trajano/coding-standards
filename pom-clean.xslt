<?xml version="1.0" encoding="UTF-8"?>
<!-- This applies the order defined in https://maven.apache.org/developers/conventions/code.html 
	and http://maven.apache.org/ref/3.2.1/maven-model/maven.html -->
<xsl:stylesheet version="1.0" xmlns:exsl="http://exslt.org/common"
	xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:m="http://maven.apache.org/POM/4.0.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:str="http://exslt.org/strings"
	xmlns:xalan="http://xml.apache.org/xslt" xmlns:xslt="http://xml.apache.org/xslt"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
	<xsl:output method="xml" indent="yes" encoding="UTF-8"
		xalan:indent-amount="4" />
	<xsl:strip-space elements="*" />

	<!-- default copy -->
	<xsl:template match="@*|node()">
		<xsl:copy>
			<xsl:apply-templates select="@*|node()" />
		</xsl:copy>
	</xsl:template>

	<!-- new line -->
	<xsl:variable name="nl">
		<xsl:text>&#xa;</xsl:text>
	</xsl:variable>

	<xsl:template match="/">
		<xsl:value-of select="$nl" />
		<xsl:apply-templates select="m:project" />
	</xsl:template>

	<xsl:template match="m:project">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:apply-templates select="m:modelVersion" />
			
			<xsl:apply-templates select="m:parent" />

			<xsl:apply-templates select="m:groupId" />
			<xsl:apply-templates select="m:artifactId" />
			<xsl:apply-templates select="m:version" />
			<xsl:apply-templates select="m:packaging" />

			<xsl:apply-templates select="m:name" />
			<xsl:apply-templates select="m:description" />
			<xsl:apply-templates select="m:url" />
			<xsl:apply-templates select="m:inceptionYear" />
			<xsl:apply-templates select="m:organization" />
			<xsl:apply-templates select="m:licenses" />

			<xsl:apply-templates select="m:developers" />
			<xsl:apply-templates select="m:contributors" />

			<xsl:apply-templates select="m:mailingLists" />

			<xsl:apply-templates select="m:prerequisites" />

			<xsl:apply-templates select="m:modules" />

			<xsl:apply-templates select="m:scm" />
			<xsl:apply-templates select="m:issueManagement" />
			<xsl:apply-templates select="m:ciManagement" />
			<xsl:apply-templates select="m:distributionManagement" />

			<xsl:apply-templates select="m:properties" />

			<xsl:apply-templates select="m:dependencyManagement" />
			<xsl:apply-templates select="m:dependencies" />

			<xsl:apply-templates select="m:repositories" />
			<xsl:apply-templates select="m:pluginRepositories" />

			<xsl:apply-templates select="m:build" />

			<xsl:apply-templates select="m:reporting" />

			<xsl:apply-templates select="m:profiles" />
		</xsl:copy>
	</xsl:template>

	<xsl:template match="parent">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:apply-templates select="m:groupId" />
			<xsl:apply-templates select="m:artifactId" />
			<xsl:apply-templates select="m:version" />
			<xsl:apply-templates select="m:relativePath" />
		</xsl:copy>
	</xsl:template>
	<xsl:template match="m:dependencies">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:apply-templates select="m:dependency">
				<xsl:sort select="m:scope" />
				<xsl:sort select="m:groupId" />
				<xsl:sort select="m:artifactId" />
			</xsl:apply-templates>
		</xsl:copy>
	</xsl:template>

	<xsl:template match="m:plugins">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:apply-templates select="m:plugin">
				<xsl:sort select="m:groupId" />
				<xsl:sort select="m:artifactId" />
			</xsl:apply-templates>
		</xsl:copy>
	</xsl:template>

	<xsl:template match="m:plugin">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:apply-templates select="m:groupId" />
			<xsl:apply-templates select="m:artifactId" />
			<xsl:apply-templates select="m:version" />
			<xsl:apply-templates select="m:reportSets" />
			<xsl:apply-templates select="m:extensions" />
			<xsl:apply-templates select="m:executions" />
			<xsl:apply-templates select="m:dependencies" />
			<xsl:apply-templates select="m:goals" />
			<xsl:apply-templates select="m:inherited" />
			<xsl:apply-templates select="m:configuration" />
		</xsl:copy>
	</xsl:template>

	<xsl:template match="m:extensions">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:apply-templates select="m:extension">
				<xsl:sort select="m:groupId" />
				<xsl:sort select="m:artifactId" />
			</xsl:apply-templates>
		</xsl:copy>
	</xsl:template>

	<xsl:template match="m:properties">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:apply-templates>
				<xsl:sort select="local-name()" />
			</xsl:apply-templates>
		</xsl:copy>
	</xsl:template>

	<xsl:template match="m:distributionManagement">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:apply-templates select="m:repository" />
			<xsl:apply-templates select="m:snapshotRepository" />
			<xsl:apply-templates select="m:site" />
			<xsl:apply-templates select="m:downloadUrl" />
			<xsl:apply-templates select="m:relocation" />
			<xsl:apply-templates select="m:status" />
		</xsl:copy>
	</xsl:template>

	<xsl:template match="m:profile">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:apply-templates select="m:id" />

			<xsl:apply-templates select="m:activation" />

			<xsl:apply-templates select="m:modules" />

			<xsl:apply-templates select="m:distributionManagement" />

			<xsl:apply-templates select="m:properties" />

			<xsl:apply-templates select="m:dependencyManagement" />
			<xsl:apply-templates select="m:dependencies" />

			<xsl:apply-templates select="m:repositories" />
			<xsl:apply-templates select="m:pluginRepositories" />

			<xsl:apply-templates select="m:build" />

			<xsl:apply-templates select="m:reporting" />
		</xsl:copy>
	</xsl:template>
</xsl:stylesheet>
