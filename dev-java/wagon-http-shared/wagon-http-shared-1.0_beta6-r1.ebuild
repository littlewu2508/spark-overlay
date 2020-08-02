# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/wagon-http-shared-1.0-beta-6.pom --download-uri https://repo1.maven.org/maven2/org/apache/maven/wagon/wagon-http-shared/1.0-beta-6/wagon-http-shared-1.0-beta-6-sources.jar --slot 0 --keywords "~amd64" --ebuild wagon-http-shared-1.0_beta6-r1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Shared Library for the wagon-http, and wagon-http-lightweight wagon
    providers."
HOMEPAGE="http://maven.apache.org/wagon/wagon-providers/wagon-http-shared"
SRC_URI="https://repo1.maven.org/maven2/org/apache/maven/wagon/${PN}/1.0-beta-6/${PN}-1.0-beta-6-sources.jar -> ${P}-sources.jar
	https://repo1.maven.org/maven2/org/apache/maven/wagon/${PN}/1.0-beta-6/${PN}-1.0-beta-6.jar -> ${P}-bin.jar"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.apache.maven.wagon:wagon-http-shared:1.0-beta-6"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${PN}-1.0-beta-6.pom
# commons-httpclient:commons-httpclient:3.1 -> >=dev-java/commons-httpclient-3.1:3
# nekohtml:nekohtml:1.9.6.2 -> >=dev-java/nekohtml-1.9.18:0
# nekohtml:xercesMinimal:1.9.6.2 -> >=dev-java/xercesMinimal-1.9.6.2:0
# org.apache.maven.wagon:wagon-provider-api:1.0-beta-6 -> >=dev-java/wagon-provider-api-1.0_beta6:0

CDEPEND="
	>=dev-java/wagon-provider-api-1.0_beta6:0
	>=dev-java/xercesMinimal-1.9.6.2:0
	>=dev-java/commons-httpclient-3.1:3
	>=dev-java/nekohtml-1.9.18:0
"

DEPEND="
	>=virtual/jdk-1.4:*
	app-arch/unzip
	!binary? (
	${CDEPEND}
	)
"

RDEPEND="
	>=virtual/jre-1.4:*
${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="commons-httpclient-3,nekohtml,xercesMinimal,wagon-provider-api"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"
