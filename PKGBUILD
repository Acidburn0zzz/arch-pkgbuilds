# Maintainer: mutantmonkey <aur@mutantmonkey.in>
# Contributor: skydrome <skydrome@tormail.org>
pkgname=tlsdate-git
pkgver=666.c0f51d4
pkgrel=1
pkgdesc="A secure rdate replacement to update local time over HTTPS"
arch=('i686' 'x86_64' 'armv6l' 'armv6h' 'arm7l' 'arm7h')
url="https://github.com/ioerror/tlsdate"
license=('BSD')
depends=('openssl' 'ca-certificates' 'dbus' 'zlib')
conflicts=('tlsdate')
provides=('tlsdate')
options=(emptydirs)
install=tlsdate.install
backup=('etc/conf.d/tlsdate'
        'etc/tlsdate/tlsdated.conf')
source=('git+https://github.com/ioerror/tlsdate.git'
        'tlsdate.conf.d'
        'tlsdate.service')
sha256sums=('SKIP'
            '1498a74913feb66c6e2e7d982f43b07fc48881947543969668a75ef4323503aa'
            '4f26258284522036975f04f41094257953a8e34e767df456caa2939df4d053fb')

pkgver() {
  cd "$srcdir/tlsdate"
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

prepare() {
    cd "$srcdir/tlsdate"
    ./autogen.sh
}

build() {
    cd "$srcdir/tlsdate"

    ./configure \
        --prefix=/usr \
        --sbindir=/usr/bin \
        --sysconfdir=/etc \
        --with-dbus-client-group=tlsdate \
        --with-unpriv-group=tlsdate \
        --with-unpriv-user=tlsdate \
        --without-polarssl
    make
}

package() {
    cd "$srcdir/tlsdate"

    make DESTDIR="$pkgdir" install
    #rm -rf "$pkgdir/usr/lib/libtlsdate_compat.a"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/tlsdate/LICENSE"
    install -Dm644 "$srcdir/tlsdate.conf.d"  "$pkgdir/etc/conf.d/tlsdate"
    install -Dm644 "$srcdir/tlsdate.service" "$pkgdir/usr/lib/systemd/system/tlsdate.service"
}

# vim:set ts=2 sw=2 et:
