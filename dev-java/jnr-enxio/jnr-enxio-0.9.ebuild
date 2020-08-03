# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/jnr-enxio-0.9.pom --download-uri https://repo.maven.apache.org/maven2/com/github/jnr/jnr-enxio/0.9/jnr-enxio-0.9-sources.jar --slot 0 --keywords "~amd64" --ebuild jnr-enxio-0.9.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"
MAVEN_ID="com.github.jnr:jnr-enxio:0.9"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="Native I/O access for java"
HOMEPAGE="http://github.com/jnr/jnr-enxio"
SRC_URI="https://repo.maven.apache.org/maven2/com/github/jnr/${PN}/${PV}/${P}-sources.jar"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# com.github.jnr:jnr-constants:0.8.7 -> >=dev-java/jnr-constants-0.8.7:0
# com.github.jnr:jnr-ffi:2.0.3 -> >=dev-java/jnr-ffi-2.0.3:0

CDEPEND="
	>=dev-java/jnr-constants-0.8.7:0
	>=dev-java/jnr-ffi-2.0.3:0
"

DEPEND="
	>=virtual/jdk-1.5:*
	${CDEPEND}
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.5:*
${CDEPEND}"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="jnr-constants,jnr-ffi"
JAVA_SRC_DIR="src/main/java"
