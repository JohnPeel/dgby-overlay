# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES="
	bitflags-1.3.2
	deunicode-1.3.2
	getopts-0.2.21
	memchr-2.5.0
	pulldown-cmark-0.9.2
	unicase-2.6.0
	unicode-width-0.1.10
	version_check-0.9.4
"

inherit cargo

DESCRIPTION="Markdown to groff (man page) converter"
HOMEPAGE="https://gitlab.com/kornelski/mandown"
SRC_URI="https://gitlab.com/kornelski/mandown/-/archive/${PV}/${P}.tar.gz
		$(cargo_crate_uris)"

LICENSE="Apache-2.0 BSD MIT Unlicense"
SLOT="0"
KEYWORDS="~amd64"
