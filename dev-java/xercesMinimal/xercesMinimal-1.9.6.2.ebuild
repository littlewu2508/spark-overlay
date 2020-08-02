# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/xercesMinimal-1.9.6.2.pom --download-uri https://repo1.maven.org/maven2/nekohtml/xercesMinimal/1.9.6.2/xercesMinimal-1.9.6.2.jar --slot 0 --keywords "~amd64" --ebuild xercesMinimal-1.9.6.2.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-binjar

DESCRIPTION="${MAVEN_ID}"
HOMEPAGE="https://wiki.gentoo.org/wiki/No_homepage"
SRC_URI="https://repo1.maven.org/maven2/nekohtml/${PN}/${PV}/${P}.jar"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
MAVEN_ID="nekohtml:xercesMinimal:1.9.6.2"

DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

JAVA_SRC_DIR="src/main/java"
