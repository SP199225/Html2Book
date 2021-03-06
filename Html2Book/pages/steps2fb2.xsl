<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:output method="xml" indent="yes"/>

	<xsl:param name="title-info.coverpage">off</xsl:param> <!-- on|off(empty) -->
	<xsl:param name="body-comments">off</xsl:param> <!-- on|off(empty) -->

	<!-- ****************** Data extractors ****************** -->
	<xsl:template name="title-info.genres.data"> <!-- Mandatory -->
		<xsl:copy-of select="book/title-info.genres.data/node()"/>
	</xsl:template>

	<xsl:variable name="title-info.author.first-name"/> <!-- Mandatory if title-info.author.nickname doesn't exist -->
	<xsl:variable name="title-info.author.middle-name"/>
	<xsl:variable name="title-info.author.last-name"/> <!-- Mandatory if title-info.author.nickname doesn't exist -->
	<xsl:variable name="title-info.author.nickname"/> <!-- Mandatory if title-title-info.author.first-name and title-info.author.last-name are not exist -->
	<xsl:variable name="title-info.author.home-page"/>
	<xsl:variable name="title-info.author.email"/>
	<xsl:variable name="title-info.author.id"/>
	<xsl:variable name="title-info.book-title"> <!-- Mandatory -->
		<xsl:copy-of select="book/title-info.book-title/text()"/>
	</xsl:variable>
	<xsl:template name="title-info.annotation.data">
		<xsl:copy-of select="book/title-info.annotation.data/node()"/>
	</xsl:template>
	<xsl:variable name="title-info.keywords"/>
	<xsl:variable name="title-info.date"/>
	<xsl:variable name="title-info.coverpage.image"> <!-- Mandatory if title-info.coverpage is on -->
		<xsl:copy-of select="book/title-info.coverpage.image/node()"/>
	</xsl:variable>
	<xsl:variable name="title-info.lang"> <!-- Mandatory -->
		<xsl:copy-of select="book/title-info.lang/text()"/>
	</xsl:variable>
	<xsl:variable name="title-info.src-lang"/>
	
	<xsl:variable name="document-info.author.first-name"/> <!-- Mandatory if title-info.author.nickname doesn't exist -->
	<xsl:variable name="document-info.author.middle-name"/>
	<xsl:variable name="document-info.author.last-name"/> <!-- Mandatory if title-info.author.nickname doesn't exist -->
	<xsl:variable name="document-info.author.nickname"/> <!-- Mandatory if title-title-info.author.first-name and title-info.author.last-name are not exist -->
	<xsl:variable name="document-info.author.home-page"/>
	<xsl:variable name="document-info.author.email"/>
	<xsl:variable name="document-info.author.id"/>
	<xsl:variable name="document-info.program-used"/>
	<xsl:variable name="document-info.date"> <!-- Mandatory -->
		<xsl:copy-of select="book/document-info.date/text()"/>
	</xsl:variable>
	<xsl:variable name="document-info.src-url"/>
	<xsl:variable name="document-info.src-ocr"/>
	<xsl:variable name="document-info.id"> <!-- Mandatory -->
		<xsl:copy-of select="book/document-info.id/text()"/>
	</xsl:variable>
	<xsl:variable name="document-info.version"> <!-- Mandatory -->
		<xsl:copy-of select="book/document-info.version/text()"/>
	</xsl:variable>
	<xsl:variable name="document-info.history"/>
	<xsl:variable name="document-info.publisher"/>
	
	<xsl:variable name="custom-info"/>
	
	<xsl:variable name="body.image"/>
	<xsl:variable name="body.title"/>
	<xsl:variable name="body.epigraph"/>
	
	<xsl:template name="body.sections.data"> <!-- Mandatory -->
		<xsl:copy-of select="book/body.sections.data/node()"/>
	</xsl:template>

	<xsl:variable name="body-comments.image"/>
	<xsl:variable name="body-comments.title"/>
	<xsl:variable name="body-comments.epigraph"/>
	<xsl:template name="body-comments.sections.data"/> <!-- Mandatory if body-comments is on -->

	<!-- ****************** Utilities ****************** -->
	<xsl:template name="mandatory-tag">
		<xsl:param name="name" />
		<xsl:param name="value" />
		<xsl:if test="string($value) = ''">
			<xsl:message terminate="yes">
				Mandatory variable '<xsl:value-of select="$name" />'is not defined!
			</xsl:message>
		</xsl:if>
	</xsl:template>

	<!-- ****************** FB2 tag data templates ****************** -->
	<xsl:template name="stylesheets">
		<!-- <stylesheet type="text/css"/> -->
	</xsl:template>
	
	<xsl:template name="title-info.genres">
		<!-- Mandatory -->
		<xsl:call-template name="title-info.genres.data"/>
	</xsl:template>

	<xsl:template name="title-info.author.first-name">
		<xsl:if test="string(book/title-info.author.first-name) != ''">
			<first-name><xsl:value-of select="book/title-info.author.first-name"/></first-name>
		</xsl:if>
	</xsl:template>
	<xsl:template name="title-info.author.middle-name">
		<xsl:if test="string(book/title-info.author.middle-name) != ''">
			<middle-name><xsl:value-of select="book/title-info.author.middle-name"/></middle-name>
		</xsl:if>
	</xsl:template>
	<xsl:template name="title-info.author.last-name">
		<xsl:if test="string(book/title-info.author.last-name) != ''">
			<last-name><xsl:value-of select="book/title-info.author.last-name"/></last-name>
		</xsl:if>
	</xsl:template>
	<xsl:template name="title-info.author.nickname">
		<xsl:if test="string(book/title-info.author.nickname) != ''">
			<nickname><xsl:value-of select="book/title-info.author.nickname"/></nickname>
		</xsl:if>
	</xsl:template>
	<xsl:template name="title-info.author.home-pages">
		<xsl:if test="string(book/title-info.author.home-page) != ''">
			<home-page><xsl:value-of select="book/title-info.author.home-page"/></home-page>
		</xsl:if>
	</xsl:template>
	<xsl:template name="title-info.author.emails">
		<xsl:if test="string(book/title-info.author.email) != ''">
			<email><xsl:value-of select="book/title-info.author.email"/></email>
		</xsl:if>
	</xsl:template>
	<xsl:template name="title-info.author.id">
		<xsl:if test="string(book/title-info.author.id) != ''">
			<id><xsl:value-of select="book/title-info.author.id"/></id>
		</xsl:if>
	</xsl:template>
	
	<xsl:template name="title-info.authors">
		<!-- Mandatory -->
		<!-- TODO: check mandatory tags -->
		<author>
			<xsl:call-template name="title-info.author.first-name"/>
			<xsl:call-template name="title-info.author.middle-name"/>
			<xsl:call-template name="title-info.author.last-name"/>
			<xsl:call-template name="title-info.author.nickname"/>
			<xsl:call-template name="title-info.author.home-pages"/>
			<xsl:call-template name="title-info.author.emails"/>
			<xsl:call-template name="title-info.author.id"/>
		</author>
	</xsl:template>
	
	<xsl:template name="title-info.book-title">
		<!-- Mandatory -->
		<xsl:call-template name="mandatory-tag">
			<xsl:with-param name="name">book/title-info.book-title</xsl:with-param>
			<xsl:with-param name="value" select="book/title-info.book-title"/>
		</xsl:call-template>

		<book-title><xsl:value-of select="book/title-info.book-title"/></book-title>
	</xsl:template>
	
	<xsl:template name="title-info.annotation">
		<annotation><xsl:call-template name="title-info.annotation.data"/></annotation>
	</xsl:template>
	
	<xsl:template name="title-info.keywords">
		<xsl:if test="string(book/title-info.keywords) != ''">
			<keywords><xsl:value-of select="book/title-info.keywords"/></keywords>
		</xsl:if>
	</xsl:template>
	
	<xsl:template name="title-info.date">
		<xsl:if test="string(book/title-info.date) != ''">
			<!-- TODO: set value attribute properly -->
			<date value="2002-10-19"><xsl:value-of select="book/title-info.date"/></date>
		</xsl:if>
	</xsl:template>
	
	<xsl:template name="title-info.coverpage.images">
		<!-- Mandatory -->
		<xsl:call-template name="mandatory-tag">
			<xsl:with-param name="name">book/title-info.coverpage.image</xsl:with-param>
			<xsl:with-param name="value" select="book/title-info.coverpage.image"/>
		</xsl:call-template>

		<xsl:variable name="imgLink" select="book/title-info.coverpage.image"/>
		<image alt="$imgLink"/>
	</xsl:template>
	
	<xsl:template name="title-info.coverpage">
		<xsl:if test="string(book/title-info.coverpage) = 'on'">
			<coverpage><xsl:call-template name="title-info.coverpage.images"/></coverpage>
		</xsl:if>
	</xsl:template>
	
	<xsl:template name="title-info.lang">
		<!-- Mandatory -->
		<xsl:call-template name="mandatory-tag">
			<xsl:with-param name="name">book/title-info.lang</xsl:with-param>
			<xsl:with-param name="value" select="book/title-info.lang"/>
		</xsl:call-template>

		<lang><xsl:value-of select="book/title-info.lang"/></lang>
	</xsl:template>
	
	<xsl:template name="title-info.src-lang">
		<xsl:if test="string(book/title-info.src-lang) != ''">
			<src-lang><xsl:value-of select="book/title-info.src-lang"/></src-lang>
		</xsl:if>
	</xsl:template>
	
	<xsl:template name="title-info.translators">
		<!-- <translator>
			<xsl:call-template name="title-info.translator.first-name"/>
			<xsl:call-template name="title-info.translator.middle-name"/>
			<xsl:call-template name="title-info.translator.last-name"/>
			<xsl:call-template name="title-info.translator.nickname"/>
			<xsl:call-template name="title-info.translator.home-page"/>
			<xsl:call-template name="title-info.translator.email"/>
			<xsl:call-template name="title-info.translator.id"/>
		</translator> -->
	</xsl:template>
	
	<xsl:template name="title-info.sequences">
		<!-- <sequence name="sequence.name" number="1" xml:lang="ru"/> -->
	</xsl:template>
	
	<xsl:template name="title-info">
		<!-- Mandatory -->
		<title-info>
			<xsl:call-template name="title-info.genres"/>
			<xsl:call-template name="title-info.authors"/>
			<xsl:call-template name="title-info.book-title"/>
			<xsl:call-template name="title-info.annotation"/>
			<xsl:call-template name="title-info.keywords"/>
			<xsl:call-template name="title-info.date"/>
			<xsl:call-template name="title-info.coverpage"/>
			<xsl:call-template name="title-info.lang"/>
			<xsl:call-template name="title-info.src-lang"/>
			<xsl:call-template name="title-info.translators"/>
			<xsl:call-template name="title-info.sequences"/>
		</title-info>
	</xsl:template>
	
	<xsl:template name="src-title-info">
		<!-- <src-title-info>
			<xsl:call-template name="src-title-info.genres"/>
			<xsl:call-template name="src-title-info.author"/>
			<xsl:call-template name="src-title-info.book-title"/>
			<xsl:call-template name="src-title-info.annotation"/>
			<xsl:call-template name="src-title-info.keywords"/>
			<xsl:call-template name="src-title-info.date"/>
			<xsl:call-template name="src-title-info.coverpage"/>
			<xsl:call-template name="src-title-info.lang"/>
			<xsl:call-template name="src-title-info.src-lang"/>
			<xsl:call-template name="src-title-info.translator"/>
			<xsl:call-template name="src-title-info.sequence"/>
		</src-title-info> -->
	</xsl:template>
	
	
	<xsl:template name="document-info.author.first-name">
		<xsl:if test="string(book/document-info.author.first-name) != ''">
			<first-name><xsl:value-of select="book/document-info.author.first-name"/></first-name>
		</xsl:if>
	</xsl:template>
	<xsl:template name="document-info.author.middle-name">
		<xsl:if test="string(book/document-info.author.middle-name) != ''">
			<middle-name><xsl:value-of select="book/document-info.author.middle-name"/></middle-name>
		</xsl:if>
	</xsl:template>
	<xsl:template name="document-info.author.last-name">
		<xsl:if test="string(book/document-info.author.last-name) != ''">
			<last-name><xsl:value-of select="book/document-info.author.last-name"/></last-name>
		</xsl:if>
	</xsl:template>
	<xsl:template name="document-info.author.nickname">
		<xsl:if test="string(book/document-info.author.nickname) != ''">
			<nickname><xsl:value-of select="book/document-info.author.nickname"/></nickname>
		</xsl:if>
	</xsl:template>
	<xsl:template name="document-info.author.home-pages">
		<xsl:if test="string(book/document-info.author.home-page) != ''">
			<home-page><xsl:value-of select="book/document-info.author.home-page"/></home-page>
		</xsl:if>
	</xsl:template>
	<xsl:template name="document-info.author.emails">
		<xsl:if test="string(book/document-info.author.email) != ''">
			<email><xsl:value-of select="book/document-info.author.email"/></email>
		</xsl:if>
	</xsl:template>
	<xsl:template name="document-info.author.id">
		<xsl:if test="string(book/document-info.author.id) != ''">
			<id><xsl:value-of select="book/document-info.author.id"/></id>
		</xsl:if>
	</xsl:template>
	
	<xsl:template name="document-info.authors">
		<!-- Mandatory -->
		<author>
			<xsl:call-template name="document-info.author.first-name"/>
			<xsl:call-template name="document-info.author.middle-name"/>
			<xsl:call-template name="document-info.author.last-name"/>
			<xsl:call-template name="document-info.author.nickname"/>
			<xsl:call-template name="document-info.author.home-pages"/>
			<xsl:call-template name="document-info.author.emails"/>
			<xsl:call-template name="document-info.author.id"/>
		</author>
	</xsl:template>
	
	
	<xsl:template name="document-info.program-used">
		<xsl:if test="string(book/document-info.program-used) != ''">
			<!-- TODO: set xml:lang attribute properly -->
			<program-used xml:lang="ru"><xsl:value-of select="book/document-info.program-used"/></program-used>
		</xsl:if>
	</xsl:template>
	
	<xsl:template name="document-info.date">
		<!-- Mandatory -->
		<xsl:call-template name="mandatory-tag">
			<xsl:with-param name="name">book/document-info.date</xsl:with-param>
			<xsl:with-param name="value" select="book/document-info.date"/>
		</xsl:call-template>

		<!-- TODO: set value attribute properly -->
		<date value="2002-10-19"><xsl:value-of select="book/document-info.date"/></date>
	</xsl:template>
	
	<xsl:template name="document-info.src-urls">
		<xsl:if test="string(book/document-info.src-url) != ''">
			<src-url><xsl:value-of select="book/document-info.src-url"/></src-url>
		</xsl:if>
	</xsl:template>

	<xsl:template name="document-info.src-ocr">
		<xsl:if test="string(book/document-info.src-ocr) != ''">
			<!-- TODO: set xml:lang attribute properly -->
			<src-ocr xml:lang="ru"><xsl:value-of select="book/document-info.src-ocr"/></src-ocr>
		</xsl:if>
	</xsl:template>
	
	<xsl:template name="document-info.id">
		<!-- Mandatory -->
		<xsl:call-template name="mandatory-tag">
			<xsl:with-param name="name">book/document-info.id</xsl:with-param>
			<xsl:with-param name="value" select="book/document-info.id"/>
		</xsl:call-template>

		<id><xsl:value-of select="book/document-info.id"/></id>
	</xsl:template>
	
	<xsl:template name="document-info.version">
		<!-- Mandatory -->
		<xsl:call-template name="mandatory-tag">
			<xsl:with-param name="name">book/document-info.version</xsl:with-param>
			<xsl:with-param name="value" select="book/document-info.version"/>
		</xsl:call-template>

		<version><xsl:value-of select="book/document-info.version"/></version>
	</xsl:template>
	
	<xsl:template name="document-info.history">
		<xsl:if test="string(book/document-info.history) != ''">
			<!-- TODO: set id and xml:lang attributes properly -->
			<history id="history" xml:lang="ru"><xsl:value-of select="book/document-info.history"/></history>
		</xsl:if>
	</xsl:template>
	
	<xsl:template name="document-info.publishers">
		<xsl:if test="string(book/document-info.publisher) != ''">
			<!-- TODO: set xml:lang attribute properly -->
			<publisher xml:lang="ru"><xsl:value-of select="book/document-info.publisher"/></publisher>
		</xsl:if>
	</xsl:template>
	
	<xsl:template name="document-info">
		<!-- Mandatory -->
		<document-info>
			<xsl:call-template name="document-info.authors"/>
			<xsl:call-template name="document-info.program-used"/>
			<xsl:call-template name="document-info.date"/>
			<xsl:call-template name="document-info.src-urls"/>
			<xsl:call-template name="document-info.src-ocr"/>
			<xsl:call-template name="document-info.id"/>
			<xsl:call-template name="document-info.version"/>
			<xsl:call-template name="document-info.history"/>
			<xsl:call-template name="document-info.publishers"/>
		</document-info>
	</xsl:template>
	
	<xsl:template name="publish-info">
		<!-- TODO: add implementation -->
		<!-- <publish-info>
			<xsl:call-template name="publish-info.book-name"/>
			<xsl:call-template name="publish-info.publisher"/>
			<xsl:call-template name="publish-info.city"/>
			<xsl:call-template name="publish-info.year"/>
			<xsl:call-template name="publish-info.isbn"/>
			<xsl:call-template name="publish-info.sequences"/>
		</publish-info> -->
	</xsl:template>
	
	<xsl:template name="custom-infos">
		<xsl:if test="string(book/custom-info) != ''">
			<!-- TODO: set info-type attribute properly -->
			<custom-info info-type="info"><xsl:value-of select="book/custom-info"/></custom-info>
		</xsl:if>
	</xsl:template>
	
	<xsl:template name="description">
		<!-- Mandatory -->
		<description>
			<xsl:call-template name="title-info"/>
			<!-- <xsl:call-template name="src-title-info"/> -->
			<xsl:call-template name="document-info"/>
			<xsl:call-template name="publish-info"/>
			<xsl:call-template name="custom-infos"/>
			<!-- <xsl:call-template name="outputs"/> -->
		</description>
	</xsl:template>
	
	<xsl:template name="body.image">
		<xsl:if test="string(book/body.image) != ''">
			<xsl:variable name="imgLink" select="book/body.image"/>
			<image alt="$imgLink"/>
		</xsl:if>
	</xsl:template>
	
	<xsl:template name="body.title">
		<xsl:if test="string(book/body.title) != ''">
			<!-- TODO: set xml:lang attribute properly -->
			<title xml:lang="ru"><xsl:value-of select="book/body.title"/></title>
		</xsl:if>
	</xsl:template>
	
	<xsl:template name="body.epigraphs">
		<xsl:if test="string(book/body.epigraph) != ''">
			<!-- TODO: set id attribute properly -->
			<epigraph id="id1"><xsl:value-of select="book/body.epigraph"/></epigraph>
		</xsl:if>
	</xsl:template>
	
	<xsl:template name="body.sections">
		<!-- Mandatory -->
		<xsl:call-template name="body.sections.data"/>
	</xsl:template>
	
	<xsl:template name="body">
		<!-- Mandatory -->
		<body>
			<xsl:call-template name="body.image"/>
			<xsl:call-template name="body.title"/>
			<xsl:call-template name="body.epigraphs"/>
			<xsl:call-template name="body.sections"/>
		</body>
	</xsl:template>
	
	<xsl:template name="body-notes">
		<!-- <body type="notes">
		</body> -->
	</xsl:template>
	
	<xsl:template name="body-comments.image">
		<xsl:if test="string(book/body-comments.image) != ''">
			<xsl:variable name="imgLink" select="book/body-comments.image"/>
			<image alt="$imgLink"/>
		</xsl:if>
	</xsl:template>
	
	<xsl:template name="body-comments.title">
		<xsl:if test="string(book/body-comments.title) != ''">
			<!-- TODO: set xml:lang attribute properly -->
			<title xml:lang="ru"><xsl:value-of select="book/body-comments.title"/></title>
		</xsl:if>
	</xsl:template>
	
	<xsl:template name="body-comments.epigraphs">
		<xsl:if test="string(book/body-comments.epigraph) != ''">
			<!-- TODO: set id attribute properly -->
			<epigraph id="id1"><xsl:value-of select="book/body-comments.epigraph"/></epigraph>
		</xsl:if>
	</xsl:template>
	
	<xsl:template name="body-comments.sections">
		<!-- Mandatory -->
		<xsl:call-template name="body-comments.sections.data"/>
	</xsl:template>
	
	<xsl:template name="body-comments">
		<xsl:if test="string($body-comments) = 'on'">
			<body type="comments">
				<xsl:call-template name="body-comments.image"/>
				<xsl:call-template name="body-comments.title"/>
				<xsl:call-template name="body-comments.epigraphs"/>
				<xsl:call-template name="body-comments.sections"/>
			</body>
		</xsl:if>
	</xsl:template>
	
	<xsl:template name="binaries">
		<!-- <binary id="cover.jpg" content-type="image/jpeg">Data</binary> -->
	</xsl:template>
	
	<!-- FB2 generator -->
	<xsl:template match="/">
		<FictionBook xmlns="http://www.gribuser.ru/xml/fictionbook/2.1" xmlns:l="http://www.w3.org/1999/xlink">
			<xsl:call-template name="stylesheets"/>
			<xsl:call-template name="description"/>
			<xsl:call-template name="body"/>
			<xsl:call-template name="body-notes"/>
			<xsl:call-template name="body-comments"/>
			<xsl:call-template name="binaries"/>
		</FictionBook>
	</xsl:template>
</xsl:stylesheet>