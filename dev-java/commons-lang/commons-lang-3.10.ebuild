# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

JAVA_PKG_IUSE="doc source test"

inherit java-pkg-2 java-pkg-simple

MY_P="${PN}3-${PV}"

DESCRIPTION="Commons components to manipulate core java classes"
HOMEPAGE="http://commons.apache.org/lang"
SRC_URI="mirror://apache/commons/lang/source/${MY_P}-src.tar.gz -> ${P}.tar.gz"
LICENSE="Apache-2.0"
SLOT="3.10"
KEYWORDS="amd64 ~ppc64 ~x86 ~amd64-linux ~x86-linux ~ppc-macos ~x86-macos ~x64-solaris"

MAVEN_ID="org.apache.commons:commons-lang3:3.10"

CDEPEND=""

DEPEND="
	${CDEPEND}
	>=virtual/jdk-1.8"

RDEPEND="
	${CDEPEND}
	>=virtual/jre-1.8"

S="${WORKDIR}/${MY_P}-src"

JAVA_ANT_ENCODING="ISO-8859-1"

DOCS=( CONTRIBUTING.md NOTICE.txt RELEASE-NOTES.txt LICENSE.txt README.md )

src_prepare() {
	default
	rm -rv src/test || die
}

src_install() {
	einstalldocs
	java-pkg-simple_src_install
}
