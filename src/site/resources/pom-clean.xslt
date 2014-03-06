<?xml version="1.0" encoding="UTF-8"?>
<!-- This applies the order defined in https://maven.apache.org/developers/conventions/code.html 
	and http://maven.apache.org/ref/3.2.1/maven-model/maven.html -->
<xsl:stylesheet version="1.0"
	xmlns:m="http://maven.apache.org/POM/4.0.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xalan="http://xml.apache.org/xslt" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
	<xsl:output method="xml" indent="yes" encoding="UTF-8"
		xalan:indent-amount="4" />
	<xsl:strip-space elements="*" />

	<!-- default copy -->
	<xsl:template match="@*|node()">
		<xsl:copy>
			<xsl:apply-templates select="@*|node()" />
		</xsl:copy>
	</xsl:template>

	<xsl:template match="/">
		<xsl:text>&#xa;</xsl:text>
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
			<xsl:text>&#xa;&#xa;</xsl:text>

			<xsl:apply-templates select="m:name" />
			<xsl:apply-templates select="m:description" />
			<xsl:apply-templates select="m:url" />
			<xsl:apply-templates select="m:inceptionYear" />
			<xsl:apply-templates select="m:organization" />
			<xsl:apply-templates select="m:licenses" />
			<xsl:if
				test="m:name|m:description|m:url|m:inceptionYear|m:organization|m:licenses">
				<xsl:text>&#xa;&#xa;</xsl:text>
			</xsl:if>

			<xsl:apply-templates select="m:developers" />
			<xsl:apply-templates select="m:contributors" />
			<xsl:if test="m:developers|m:contributors">
				<xsl:text>&#xa;&#xa;</xsl:text>
			</xsl:if>

			<xsl:apply-templates select="m:mailingLists" />
			<xsl:if test="m:mailingLists">
				<xsl:text>&#xa;&#xa;</xsl:text>
			</xsl:if>

			<xsl:apply-templates select="m:prerequisites" />
			<xsl:if test="m:prerequisites">
				<xsl:text>&#xa;&#xa;</xsl:text>
			</xsl:if>

			<xsl:apply-templates select="m:modules" />

			<xsl:apply-templates select="m:scm" />
			<xsl:apply-templates select="m:issueManagement" />
			<xsl:apply-templates select="m:ciManagement" />
			<xsl:apply-templates select="m:distributionManagement" />
			<xsl:if
				test="m:scm|m:issueManagement|m:ciManagement|m:distributionManagement">
				<xsl:text>&#xa;&#xa;</xsl:text>
			</xsl:if>

			<xsl:apply-templates select="m:properties" />

			<xsl:apply-templates select="m:dependencyManagement" />
			<xsl:apply-templates select="m:dependencies" />
			<xsl:if test="m:dependencyManagement|m:dependencies">
				<xsl:text>&#xa;&#xa;</xsl:text>
			</xsl:if>

			<xsl:apply-templates select="m:repositories" />
			<xsl:apply-templates select="m:pluginRepositories" />
			<xsl:if test="m:repositories|m:pluginRepositories">
				<xsl:text>&#xa;&#xa;</xsl:text>
			</xsl:if>

			<xsl:apply-templates select="m:build" />
			<xsl:if test="m:build">
				<xsl:text>&#xa;&#xa;</xsl:text>
			</xsl:if>

			<xsl:apply-templates select="m:reporting" />
			<xsl:if test="m:reporting">
				<xsl:text>&#xa;&#xa;</xsl:text>
			</xsl:if>

			<xsl:apply-templates select="m:profiles" />
		</xsl:copy>
	</xsl:template>

	<xsl:template match="m:modelVersion">
		<xsl:copy>
			<xsl:copy-of select="@*|node()" />
		</xsl:copy>
		<xsl:text>&#xa;&#xa;</xsl:text>
	</xsl:template>

	<xsl:template match="m:parent">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:apply-templates select="m:groupId" />
			<xsl:apply-templates select="m:artifactId" />
			<xsl:apply-templates select="m:version" />
			<xsl:apply-templates select="m:relativePath" />
		</xsl:copy>
		<xsl:text>&#xa;&#xa;</xsl:text>
	</xsl:template>

	<xsl:template match="m:modules">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:apply-templates select="m:module">
				<xsl:sort select="text()" />
			</xsl:apply-templates>
		</xsl:copy>
		<xsl:text>&#xa;&#xa;</xsl:text>
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

	<xsl:template match="m:profiles">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:apply-templates select="m:profile">
				<xsl:sort select="m:id" />
			</xsl:apply-templates>
		</xsl:copy>
	</xsl:template>

	<xsl:template match="m:build/m:extensions">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:apply-templates select="m:extension">
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
			<xsl:copy-of select="m:extensions" />
			<xsl:apply-templates select="m:executions" />
			<xsl:apply-templates select="m:dependencies" />
			<xsl:apply-templates select="m:goals" />
			<xsl:apply-templates select="m:inherited" />
			<xsl:apply-templates select="m:configuration" />
		</xsl:copy>
	</xsl:template>

	<xsl:template match="m:properties">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:apply-templates>
				<xsl:sort select="local-name()" />
			</xsl:apply-templates>
		</xsl:copy>
		<xsl:text>&#xa;&#xa;</xsl:text>
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

	<xsl:template match="m:build">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:apply-templates select="m:defaultGoal" />
		
			<xsl:apply-templates select="m:finalName" />
		
			<xsl:apply-templates select="m:sourceDirectory" />
			<xsl:apply-templates select="m:scriptSourceDirectory" />
			<xsl:apply-templates select="m:resources" />
		
			<xsl:apply-templates select="m:testSourceDirectory" />
			<xsl:apply-templates select="m:testOutputDirectory" />
			<xsl:apply-templates select="m:testResources" />
		
			<xsl:apply-templates select="m:directory" />
			<xsl:apply-templates select="m:outputDirectory" />
		
			<xsl:apply-templates select="m:pluginManagement" />
			<xsl:apply-templates select="m:plugins" />
		
			<xsl:apply-templates select="m:extensions" />
		
			<xsl:apply-templates select="m:filters" />
		</xsl:copy>
	</xsl:template>

	<xsl:template match="m:profile">
		<xsl:copy>
			<xsl:copy-of select="@*" />
			<xsl:apply-templates select="m:id" />
			<xsl:if test="m:id">
				<xsl:text>&#xa;&#xa;</xsl:text>
			</xsl:if>

			<xsl:apply-templates select="m:activation" />
			<xsl:if test="m:activation">
				<xsl:text>&#xa;&#xa;</xsl:text>
			</xsl:if>

			<xsl:apply-templates select="m:modules" />

			<xsl:apply-templates select="m:distributionManagement" />
			<xsl:if test="m:distributionManagement">
				<xsl:text>&#xa;&#xa;</xsl:text>
			</xsl:if>

			<xsl:apply-templates select="m:properties" />

			<xsl:apply-templates select="m:dependencyManagement" />
			<xsl:apply-templates select="m:dependencies" />

			<xsl:apply-templates select="m:repositories" />
			<xsl:apply-templates select="m:pluginRepositories" />

			<xsl:apply-templates select="m:build" />

			<xsl:apply-templates select="m:reporting" />
		</xsl:copy>
		<xsl:if test="position() != last()">
			<xsl:text>&#xa;&#xa;</xsl:text>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
