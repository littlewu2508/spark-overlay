# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/msv-rngconverter-2013.6.1.pom --from-maven-central --download-uri https://repo1.maven.org/maven2/net/java/dev/msv/msv-rngconverter/2013.6.1/msv-rngconverter-2013.6.1-sources.jar --binjar-uri https://repo1.maven.org/maven2/net/java/dev/msv/msv-rngconverter/2013.6.1/msv-rngconverter-2013.6.1.jar --slot 0 --keywords "~amd64" --ebuild msv-rngconverter-2013.6.1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

MAVEN_ID="net.java.dev.msv:msv-rngconverter:2013.6.1"
DESCRIPTION="MSV RNG Converter"
HOMEPAGE="http://msv.java.net/msv-rngconverter"
SRC_URI="https://repo1.maven.org/maven2/net/java/dev/msv/${PN}/${PV}/${P}-sources.jar
	https://repo1.maven.org/maven2/net/java/dev/msv/${PN}/${PV}/${P}.jar -> ${P}-bin.jar"
LICENSE="BSD-1"
SLOT="0"
KEYWORDS="~amd64"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# net.java.dev.msv:msv-core:2013.6.1 -> >=dev-java/msv-20130601:0
# net.java.dev.msv:xsdlib:2013.6.1 -> >=dev-java/xsdlib-20090415:0
# xerces:xercesImpl:2.9.1 -> >=dev-java/xerces-2.12.0:2

CDEPEND="
	>=dev-java/msv-20130601:0
	>=dev-java/xerces-2.12.0:2
	>=dev-java/xsdlib-20090415:0
"

DEPEND="
	>=virtual/jdk-1.5:*
	app-arch/unzip
	!binary? (
	${CDEPEND}
	)
	test? (

		amd64? (
			dev-util/pkgdiff
			dev-util/japi-compliance-checker
		)
	)
"

RDEPEND="
	>=virtual/jre-1.5:*
${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="msv,xsdlib,xerces-2"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"

JAVA_TESTING_FRAMEWORKS="pkgdiff"
