# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

DESCRIPTION="Package for Simba development environment"
HOMEPAGE="http://wizzup.org/simba/"
SRC_URI=""

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 arm x86"
IUSE="keybinder ffi"

RDEPEND=""
DEPEND="${RDEPEND}
	dev-lang/fpc
	dev-lang/lazarus
	x11-libs/libXtst
	keybinder? ( =dev-libs/keybinder-0.3.0-r200 )
	ffi? ( dev-libs/libffi )
"
