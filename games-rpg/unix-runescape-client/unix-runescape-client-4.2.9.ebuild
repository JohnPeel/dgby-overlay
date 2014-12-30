# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit games

MY_PN="rsu-client"
MY_P="${MY_PN}-${PV}"
S=${WORKDIR}/${MY_P}
DESCRIPTION="RuneScape client for Linux and Unix"
HOMEPAGE="https://github.com/HikariKnight/rsu-client"
SRC_URI="https://github.com/HikariKnight/${MY_PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE="alsa-oss cario-nogl p7zip pulseaudio wine"

DEPEND="virtual/jre
		dev-lang/perl
		dev-perl/Archive-Extract
		dev-perl/Config-IniFiles
		dev-perl/IO-stringy
		dev-perl/wxperl
		net-misc/wget
		alsa-oss? ( media-libs/alsa-oss )
		cario-nogl? ( x11-libs/cairo[-opengl] )
		p7zip? ( app-arch/p7zip )
		pulseaudio? ( media-sound/pulseaudio )
		wine? ( app-emulation/wine )"
RDEPEND="${DEPEND}"

src_unpack() {
  unpack ${A}

  # Removing old libraries, cario-nogl installs new ones
  rm -rf "${S}/runescape/rsu/3rdParty/linux/cairo-nogl"
}

src_install() {
  cd "${PN}"

  games_make_wrapper ${PN} ./runescape "${GAMES_PREFIX_OPT}/${PN}" || die "games_make_wrapper failed"

  insinto "${GAMES_PREFIX_OPT}/${PN}"
  doins -r * || die "doins failed"
  
  make_desktop_entry runescape "RuneScape Unix Client" \
  	"${GAMES_PREFIX_OPT}/${PN}/share/runescape.png" || die "make_desktop_entry failed"

  dodoc AUTHORS COPYING changelog.txt bin/README.md || die "dodoc failed"

  prepgamesdirs
}

