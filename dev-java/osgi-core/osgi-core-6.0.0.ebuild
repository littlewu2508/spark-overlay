# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Skeleton command:
# java-ebuilder --generate-ebuild --workdir . --pom /var/lib/java-ebuilder/poms/org.osgi.core-6.0.0.pom --download-uri https://repo.maven.apache.org/maven2/org/osgi/org.osgi.core/6.0.0/org.osgi.core-6.0.0-sources.jar --slot 6 --keywords "~amd64" --ebuild osgi-core-6.0.0.ebuild

EAPI=7

JAVA_PKG_IUSE="doc source"

inherit java-pkg-2 java-pkg-simple java-pkg-maven

DESCRIPTION="OSGi Core Release 6, Interfaces and Classes for use in compiling bundles."
HOMEPAGE="http://www.osgi.org"
SRC_URI="https://repo.maven.apache.org/maven2/org/osgi/org.osgi.core/${PV}/org.osgi.core-${PV}-sources.jar -> ${P}-sources.jar"
LICENSE=""
SLOT="6"
KEYWORDS="~amd64"
MAVEN_ID="org.osgi:org.osgi.core:6.0.0"
MAVEN_PROVIDES="org.osgi:osgi.core:6.0.0"


# Common dependencies
# POM: /var/lib/java-ebuilder/poms/${P}.pom
# org.osgi:org.osgi.annotation:6.0.0 -> >=dev-java/osgi-annotation-6.0.0

DEPEND="
	>=virtual/jdk-1.8:*
	app-arch/unzip
	>=dev-java/osgi-annotation-6.0.0:6
"

RDEPEND="
	>=virtual/jre-1.8:*
"

S="${WORKDIR}"

JAVA_GENTOO_CLASSPATH="osgi-annotation-6"

JAVA_SRC_DIR="src/main/java"

