pkgname=repo-make
pkgver=$(sed -rn 's/.*\$VERSION = .(.+?).;$/\1/p' repo-make)
pkgrel=1
pkgdesc="Tool to autobuild a set of PKGBUILDs into a working repository"
url=""
arch=('any')
license=('AGPL3')
depends=('perl')

package() {
  cd "$startdir"
  make DESTDIR=$pkgdir PREFIX=/usr install
}
