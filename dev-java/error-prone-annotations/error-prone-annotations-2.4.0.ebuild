# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

MY_PN="${PN%-annotations}"
MY_P="${MY_PN}-${PV}"
JAVA_PKG_IUSE="doc source"
MAVEN_ID="com.google.errorprone:error_prone_annotations:2.4.0"

inherit java-pkg-2 java-pkg-simple

DESCRIPTION="Java annotations for the Error Prone static analysis tool"
HOMEPAGE="http://errorprone.info"
SRC_URI="https://github.com/google/${MY_PN}/archive/v${PV}.tar.gz -> ${MY_P}.tar.gz"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~x86"

DEPEND=">=virtual/jdk-1.8"
RDEPEND=">=virtual/jre-1.8"

S="${WORKDIR}/${MY_P}/annotations"
JAVA_SRC_DIR="src/main/java"
