# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES="
	aho-corasick-0.7.19
	android_system_properties-0.1.5
	anyhow-1.0.66
	async-broadcast-0.4.1
	async-channel-1.7.1
	async-executor-1.5.0
	async-io-1.10.0
	async-lock-2.6.0
	async-recursion-0.3.2
	async-task-4.3.0
	async-trait-0.1.58
	atty-0.2.14
	autocfg-1.1.0
	bitflags-1.3.2
	block-buffer-0.10.3
	bumpalo-3.11.1
	byteorder-1.4.3
	bytes-1.2.1
	cache-padded-1.2.0
	cc-1.0.76
	cfg-if-1.0.0
	chrono-0.4.22
	clap-3.2.23
	clap_derive-3.2.18
	clap_lex-0.2.4
	codespan-reporting-0.11.1
	concurrent-queue-1.2.4
	concurrent-queue-2.0.0
	core-foundation-sys-0.8.3
	cpufeatures-0.2.5
	crossbeam-utils-0.8.12
	crypto-common-0.1.6
	cxx-1.0.81
	cxx-build-1.0.81
	cxxbridge-flags-1.0.81
	cxxbridge-macro-1.0.81
	derivative-2.2.0
	digest-0.10.5
	dirs-4.0.0
	dirs-sys-0.3.7
	enumflags2-0.7.5
	enumflags2_derive-0.7.4
	env_logger-0.9.3
	event-listener-2.5.3
	fastrand-1.8.0
	form_urlencoded-1.1.0
	fs2-0.4.3
	futures-0.3.25
	futures-channel-0.3.25
	futures-core-0.3.25
	futures-executor-0.3.25
	futures-io-0.3.25
	futures-lite-1.12.0
	futures-macro-0.3.25
	futures-sink-0.3.25
	futures-task-0.3.25
	futures-util-0.3.25
	generic-array-0.14.6
	getrandom-0.2.8
	hashbrown-0.12.3
	heck-0.4.0
	hermit-abi-0.1.19
	hex-0.4.3
	humantime-2.1.0
	iana-time-zone-0.1.53
	iana-time-zone-haiku-0.1.1
	idna-0.3.0
	indexmap-1.9.1
	instant-0.1.12
	ipnet-2.5.1
	iptables-0.5.0
	itoa-1.0.4
	js-sys-0.3.60
	lazy_static-1.4.0
	libc-0.2.137
	link-cplusplus-1.0.7
	lock_api-0.4.9
	log-0.4.17
	memchr-2.5.0
	memoffset-0.6.5
	netlink-packet-core-0.4.2
	netlink-packet-route-0.13.0
	netlink-packet-utils-0.5.1
	netlink-sys-0.8.3
	nix-0.23.1
	nix-0.25.0
	num-integer-0.1.45
	num-traits-0.2.15
	once_cell-1.16.0
	ordered-float-2.10.0
	ordered-stream-0.0.1
	os_str_bytes-6.3.1
	parking-2.0.0
	parking_lot-0.12.1
	parking_lot_core-0.9.4
	paste-1.0.9
	percent-encoding-2.2.0
	pin-project-lite-0.2.9
	pin-utils-0.1.0
	polling-2.4.0
	ppv-lite86-0.2.17
	proc-macro-crate-1.2.1
	proc-macro-error-1.0.4
	proc-macro-error-attr-1.0.4
	proc-macro2-1.0.47
	quote-1.0.21
	rand-0.8.5
	rand_chacha-0.3.1
	rand_core-0.6.4
	redox_syscall-0.2.16
	redox_users-0.4.3
	regex-1.7.0
	regex-syntax-0.6.28
	remove_dir_all-0.5.3
	ryu-1.0.11
	same-file-1.0.6
	scopeguard-1.1.0
	scratch-1.0.2
	serde-1.0.147
	serde-value-0.7.0
	serde_derive-1.0.147
	serde_json-1.0.87
	serde_repr-0.1.9
	sha1-0.6.1
	sha1_smol-1.0.0
	sha2-0.10.6
	slab-0.4.7
	smallvec-1.10.0
	socket2-0.4.7
	static_assertions-1.1.0
	strsim-0.10.0
	syn-1.0.103
	sysctl-0.5.2
	tempfile-3.3.0
	termcolor-1.1.3
	textwrap-0.16.0
	thiserror-1.0.37
	thiserror-impl-1.0.37
	tinyvec-1.6.0
	tinyvec_macros-0.1.0
	toml-0.5.9
	tracing-0.1.37
	tracing-attributes-0.1.23
	tracing-core-0.1.30
	typenum-1.15.0
	uds_windows-1.0.2
	unicode-bidi-0.3.8
	unicode-ident-1.0.5
	unicode-normalization-0.1.22
	unicode-width-0.1.10
	url-2.3.1
	version_check-0.9.4
	waker-fn-1.1.0
	walkdir-2.3.2
	wasi-0.11.0+wasi-snapshot-preview1
	wasm-bindgen-0.2.83
	wasm-bindgen-backend-0.2.83
	wasm-bindgen-macro-0.2.83
	wasm-bindgen-macro-support-0.2.83
	wasm-bindgen-shared-0.2.83
	wepoll-ffi-0.1.2
	winapi-0.3.9
	winapi-i686-pc-windows-gnu-0.4.0
	winapi-util-0.1.5
	winapi-x86_64-pc-windows-gnu-0.4.0
	windows-sys-0.42.0
	windows_aarch64_gnullvm-0.42.0
	windows_aarch64_msvc-0.42.0
	windows_i686_gnu-0.42.0
	windows_i686_msvc-0.42.0
	windows_x86_64_gnu-0.42.0
	windows_x86_64_gnullvm-0.42.0
	windows_x86_64_msvc-0.42.0
	zbus-2.3.2
	zbus_macros-2.3.2
	zbus_names-2.1.0
	zvariant-3.4.1
	zvariant_derive-3.4.1
"

inherit cargo

DESCRIPTION="A container network stack"
HOMEPAGE="https://github.com/containers/netavark"
SRC_URI="https://github.com/containers/netavark/archive/v${PV}.tar.gz -> ${P}.tar.gz
		$(cargo_crate_uris)"

LICENSE="MIT Apache-2.0 Apache-2.0-with-LLVM-exceptions BSD BSD-2 Boost-1.0 MIT Unicode-DFS-2016 Unlicense ZLIB"
SLOT="0"
KEYWORDS="~amd64"

BDEPEND="
		app-text/mandown
"

src_compile() {
	cargo_src_compile

	emake docs -C docs
}

src_install() {
	# cargo_src_install

	exeinto /usr/libexec/podman
	doexe target/release/netavark

	doman "${S}/docs/netavark.1"

	dodoc README.md
}
