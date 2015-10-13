# Maintainer: Yurii Kolesnykov <yurikoles@gmail.com>
# Contributor: Gustavo <sl1pkn07@gmail.com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Balló György <ballogyor+arch@gmail.com>

pkgbase=libindicator
pkgname=('libindicator-gtk2' 'libindicator-gtk3')
pkgver=12.10.1
pkgrel=6
pkgdesc='A set of symbols and convenience functions for Ayatana indicators'
arch=('i686' 'x86_64')
url='https://launchpad.net/libindicator'
license=('GPL')
makedepends=('gtk2' 'gtk3')
source=("https://launchpad.net/libindicator/${pkgver%.*}/${pkgver}/+download/libindicator-${pkgver}.tar.gz")
sha256sums=('b2d2e44c10313d5c9cd60db455d520f80b36dc39562df079a3f29495e8f9447f')

prepare() {
  sed '/-Werror/s/$/ -Wno-deprecated-declarations/' -i libindicator-${pkgver}/libindicator/Makefile.{am,in}
  sed 's/LIBINDICATOR_LIBS+="$LIBM"/LIBINDICATOR_LIBS+=" $LIBM"/g' -i libindicator-${pkgver}/configure
  sed 's/LIBM="-lmw"/LIBM=" -lmw"/g' -i libindicator-${pkgver}/configure
  sed 's/LIBM="-lm"/LIBM=" -lm"/g' -i libindicator-${pkgver}/configure
  sed 's/LIBS="-lm  $LIBS"/LIBS=" -lm  $LIBS"/g' -i libindicator-${pkgver}/configure
  sed 's/LIBS="-lmw  $LIBS"/LIBS=" -lmw  $LIBS"/g' -i libindicator-${pkgver}/configure


  mkdir -p build-gtk{2,3}
}

build() {
  cd build-gtk3

  ../libindicator-${pkgver}/configure \
    --prefix='/usr' \
    --localstatedir='/var' \
    --libexecdir='/usr/lib/libindicator' \
    --sysconfdir='/etc' \
    --disable-static \
    --disable-tests
  make

  cd ../build-gtk2

  ../libindicator-${pkgver}/configure \
    --prefix='/usr' \
    --localstatedir='/var' \
    --libexecdir='/usr/lib/libindicator' \
    --sysconfdir='/etc' \
    --with-gtk='2' \
    --disable-static \
    --disable-tests
  make
}

package_libindicator-gtk2() {
  depends=('gtk2')
  provides=('libindicator')
  conflicts=('libindicator')

  cd build-gtk2

  make -j1 DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/share
}

package_libindicator-gtk3() {
  depends=('gtk3')
  provides=('libindicator3')
  conflicts=('libindicator3')

  cd build-gtk3

  make -j1 DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/share
}

# vim: ts=2 sw=2 et: