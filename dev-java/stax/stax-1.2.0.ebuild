# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/stax-1.2.0.pom --download-uri https://repo1.maven.org/maven2/stax/stax/1.2.0/stax-1.2.0-sources.jar --slot 0 --keywords "~amd64" --ebuild stax-1.2.0.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source binary test"
MAVEN_ID="stax:stax:1.2.0"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="StAX is the reference implementation of the StAX API"
HOMEPAGE="http://stax.codehaus.org/"
SRC_URI="https://repo1.maven.org/maven2/${PN}/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/${PN}/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# stax:stax-api:1.0.1 -> >=java-virtuals/stax-api-1:0

CDEPEND="
	java-virtuals/stax-api:0
"

DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
	!binary? ( ${CDEPEND} )
"

RDEPEND="
	>=virtual/jre-1.8:*
	${CDEPEND}"

S="${WORKDIR}"

JAVA_ENCODING="iso-8859-1"
JAVA_GENTOO_CLASSPATH="stax-api"
JAVA_SRC_DIR="src/main/java"
JAVE_BINJAR_FILENAME="${P}-bin.jar"
