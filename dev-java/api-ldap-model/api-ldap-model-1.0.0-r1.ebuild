# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/api-ldap-model-1.0.0-M20.pom --download-uri https://repo1.maven.org/maven2/org/apache/directory/api/api-ldap-model/1.0.0-M20/api-ldap-model-1.0.0-M20-sources.jar --slot 0 --keywords "~amd64" --ebuild api-ldap-model-1.0.0-r1.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source test binary"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Common LDAP Model used by clients and servers"
HOMEPAGE="http://directory.apache.org/api-parent/api-ldap-parent/api-ldap-model/"
SRC_URI="https://repo1.maven.org/maven2/org/apache/directory/api/${PN}/${PV}-M20/${P}-M20-sources.jar -> ${P}-sources.jar
	https://repo1.maven.org/maven2/org/apache/directory/api/${PN}/${PV}-M20/${P}-M20.jar -> ${P}-bin.jar"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="org.apache.directory.api:api-ldap-model:1.0.0-M20"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}-M20.pom
# antlr:antlr:2.7.7 -> >=dev-java/antlr-2.7.7:0
# commons-collections:commons-collections:3.2.1 -> >=dev-java/commons-collections-3.2.1:0
# commons-lang:commons-lang:2.6 -> >=dev-java/commons-lang-2.6:2.1
# org.apache.directory.api:api-asn1-api:1.0.0-M20 -> >=dev-java/api-asn1-api-1.0.0:0
# org.apache.directory.api:api-asn1-ber:1.0.0-M20 -> >=dev-java/api-asn1-ber-1.0.0:0
# org.apache.directory.api:api-i18n:1.0.0-M20 -> >=dev-java/api-i18n-1.0.0:0
# org.apache.directory.api:api-util:1.0.0-M20 -> >=dev-java/api-util-1.0.0:0
# org.apache.mina:mina-core:2.0.7 -> >=dev-java/mina-core-2.0.7:0
# org.slf4j:slf4j-api:1.7.5 -> >=dev-java/slf4j-api-1.7.7:0

CDEPEND="
	>=dev-java/api-asn1-api-1.0.0:0
	>=dev-java/api-asn1-ber-1.0.0:0
	>=dev-java/api-i18n-1.0.0:0
	>=dev-java/api-util-1.0.0:0
	>=dev-java/antlr-2.7.7:0
	>=dev-java/commons-collections-3.2.1:0
	>=dev-java/commons-lang-2.6:2.1
	>=dev-java/mina-core-2.0.7:0
	>=dev-java/slf4j-api-1.7.7:0
"

# Compile dependencies
# POM: /var/lib/java-ebuilder/poms/${P}-M20.pom
# findbugs:annotations:1.0.0 -> >=dev-java/findbugs-annotations-3.0.12:3

DEPEND="
	>=virtual/jdk-1.6:*
	app-arch/unzip
	!binary? (
	${CDEPEND}
	>=dev-java/findbugs-annotations-3.0.12:3
	)
"

RDEPEND="
	>=virtual/jre-1.6:*
${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="antlr,commons-collections,commons-lang-2.1,api-asn1-api,api-asn1-ber,api-i18n,api-util,mina-core,slf4j-api"
JAVA_CLASSPATH_EXTRA="findbugs-annotations-3"
JAVA_SRC_DIR="src/main/java"
JAVA_BINJAR_FILENAME="${P}-bin.jar"

