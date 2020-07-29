# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/org.osgi.core-1.4.0.pom --download-uri https://repo.maven.apache.org/maven2/org/apache/felix/org.osgi.core/1.4.0/org.osgi.core-1.4.0-sources.jar --slot 1 --keywords "~amd64" --ebuild osgi-core-1.4.0.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="OSGi Service Platform Release 4 Core Interfaces and Classes."
HOMEPAGE="http://felix.apache.org/org.osgi.core/"
SRC_URI="https://repo.maven.apache.org/maven2/org/apache/felix/org.osgi.core/${PV}/org.osgi.core-${PV}-sources.jar -> ${P}-sources.jar"
LICENSE=""
SLOT="1"
KEYWORDS="~amd64"
MAVEN_ID="org.apache.felix:org.osgi.core:1.4.0"



DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
"

RDEPEND="
	>=virtual/jre-1.3:*
"

S="${WORKDIR}"

JAVA_RESOURCE_DIRS=(
	"src/main/resources"
)

JAVA_SRC_DIR="src/main/java"
