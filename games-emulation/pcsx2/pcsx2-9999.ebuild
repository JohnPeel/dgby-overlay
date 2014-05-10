# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

inherit git-2 cmake-utils

DESCRIPTION="PCSX2 is an open source Playstation 2 emulator."
HOMEPAGE="http://pcsx2.net/"
SRC_URI=""
EGIT_REPO_URI="https://github.com/PCSX2/pcsx2"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="alpha ~amd64 ~x86"

RDEPEND="media-libs/alsa-lib
	app-arch/bzip2
	media-libs/glew
	=x11-libs/wxGTK-2.8.10.1-r5
	virtual/jpeg
	media-libs/portaudio
	media-libs/libsdl
	dev-cpp/sparsehash
	media-gfx/nvidia-cg-toolkit
	media-libs/libsoundtouch
	dev-libs/libaio"
DEPEND="${RDEPEND}
	dev-vcs/git"

src_configure() {
	local mycmakeargs=(
		-DCG_LIBRARY:PATH=/opt/nvidia-cg-toolkit/lib32/libCg.so
		-DCG_GL_LIBRARY:PATH=/opt/nvidia-cg-toolkit/lib32/libCgGL.so
		-DUSER_CMAKE_C_FLAGS:STRING="-DwxSIZE_T_IS_UINT"
		-DUSER_CMAKE_CXX_FLAGS:STRING="-DwxSIZE_T_IS_UINT"
		-DUSER_CMAKE_LD_FLAGS:STRING="-L/lib32 -L/usr/lib32"
	)
	cmake-utils_src_configure
}
