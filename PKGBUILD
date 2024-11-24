pkgname=freaky-adventure
pkgver=1.0.0           # Version of the software
pkgrel=1               # Package release number
arch=('x86_64')        # Architectures
url="https://example.com"  # Project URL
license=('MIT')        # License type
depends=('dependency1' 'dependency2')  # Runtime dependencies
makedepends=('make' 'gcc')  # Build-time dependencies
source=("https://example.com/my-package-$pkgver.tar.gz") # Download source
sha256sums=('SKIP')    # Replace with actual checksum for verification

build() {
    cd "$srcdir/$pkgname-$pkgver"
    ./configure --prefix=/usr
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
}
