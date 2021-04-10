# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake

IUSE="+bzip2 +lz4 +parquet +python +snappy +zlib +zstd"

DESCRIPTION="A cross-language development platform for in-memory data."
HOMEPAGE="https://arrow.apache.org/"
SRC_URI="https://www.apache.org/dyn/closer.lua?action=download&filename=arrow/arrow-${PV}/${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

BDEPEND="
	>=net-libs/grpc-1.33.2
	>=dev-libs/jemalloc-5.2.1
	>=dev-cpp/gtest-1.10.0
	>=dev-libs/re2-0.2019.08.01
	snappy? ( >=app-arch/snappy-1.1.8 )
	bzip2? ( >=app-arch/bzip2-1.0.8 )
	zstd? ( >=app-arch/zstd-1.4.5 )
	zlib? ( >=sys-libs/zlib-1.2.1 )
	>=dev-python/thrift-0.12.0
	dev-libs/rapidjson
	>=net-dns/c-ares-1.16.1
	>=dev-cpp/benchmark-1.5.2
	>=dev-libs/libutf8proc-2.5.0
"

DEPEND="${BDEPEND}"

S="${WORKDIR}/${P}/cpp"

src_prepare() {
	sed -e '/SetupCxxFlags/d' -i CMakeLists.txt || die
	cmake_src_prepare
}

src_configure () {
	local mycmakeargs=(
		-DARROW_PARQUET=$(usex parquet ON OFF)
		-DARROW_WITH_BZ2=$(usex bzip2 ON OFF)
		-DARROW_WITH_LZ4=$(usex lz4 ON OFF)
		-DARROW_WITH_SNAPPY=$(usex snappy ON OFF)
		-DARROW_PYTHON=$(usex python ON OFF)
		-DARROW_WITH_ZLIB=$(usex zlib ON OFF)
		-DARROW_WITH_ZSTD=$(usex zstd ON OFF)
	)
	cmake_src_configure
}
