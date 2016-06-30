pkg_origin='domocile'
pkg_name='unrar'
pkg_distname=$pkg_name
pkg_version='5.4.2'
pkg_dirname=${pkg_distname}
pkg_maintainer="Brandon Raabe <brandocorp@gmail.com>"
pkg_license=('UnRAR')
pkg_source=http://www.rarlab.com/rar/${pkg_name}src-${pkg_version}.tar.gz
pkg_shasum='d91d5fa8abdbac60b3e2b7317cc1451a2b38c550adee977b847f22594c53f1bd'
pkg_deps=()
pkg_build_deps=(
  core/make
  core/coreutils
  core/gcc
)
pkg_bin_dirs=(bin)
pkg_include_dirs=(include)
pkg_lib_dirs=(lib)

do_build() {
  make CXX=c++ \
    CXXFLAGS=-O2 \
    LIBFLAGS=-fPIC \
    DEFINES="-D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -DRAR_SMP" \
    STRIP="strip"
    LDFLAGS="-pthread"
}

do_install() {
  install -D unrar $pkg_prefix/bin/unrar
}

