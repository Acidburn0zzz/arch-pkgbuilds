# Maintainer: Darshit Shah <darnir@gmail.com>
pkgname=libpsl
pkgver=0.9.0
pkgrel=1
pkgdesc="A Publix Suffic List library"
arch=('i686' 'x86_64')
url="https://github.com/rockdaboot/libpsl"
license=('MIT')
depends=('icu>=55.1-1')
source=("https://github.com/rockdaboot/libpsl/releases/download/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.gz")

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure \
    --prefix=/usr \
    --disable-static \
    --disable-dependency-tracking \
    --enable-man \
    --enable-builtin=libicu
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install

  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 "${srcdir}/${pkgname}-${pkgver}/COPYING" \
    "${pkgdir}/usr/share/licenses/${pkgname}/"
}

# vim: ts=2:sw=2:et
md5sums=('c8d5f25fb089f5a9da7a9c1571f7c41f')
