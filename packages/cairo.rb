require 'package'

class Cairo < Package
  description 'Cairo is a 2D graphics library with support for multiple output devices.'
  homepage 'https://www.cairographics.org'
  version '1.14.10-2'
  source_url 'https://www.cairographics.org/releases/cairo-1.14.10.tar.xz'
  source_sha256 '7e87878658f2c9951a14fc64114d4958c0e65ac47530b8ac3078b2ce41b66a09'

  binary_url ({
    aarch64: 'https://dl.bintray.com/chromebrew/chromebrew/cairo-1.14.10-2-chromeos-armv7l.tar.xz',
     armv7l: 'https://dl.bintray.com/chromebrew/chromebrew/cairo-1.14.10-2-chromeos-armv7l.tar.xz',
       i686: 'https://dl.bintray.com/chromebrew/chromebrew/cairo-1.14.10-2-chromeos-i686.tar.xz',
     x86_64: 'https://dl.bintray.com/chromebrew/chromebrew/cairo-1.14.10-2-chromeos-x86_64.tar.xz',
  })
  binary_sha256 ({
    aarch64: '702c142917c4c56dad6033b1cc06c8437e8caf3d0bdac9412d5fe17acee94e86',
     armv7l: '702c142917c4c56dad6033b1cc06c8437e8caf3d0bdac9412d5fe17acee94e86',
       i686: 'a7e5aa52792bbf3a3583ddeee98f4c6cafd9ade05f1824e2f71c214f123176fb',
     x86_64: '452b001317f7ddbecb964f1e053b8d0d1e49855c014fdbd1cc7a201311437f34',
  })

  depends_on 'libpng'
  depends_on 'pixman'
  depends_on 'freetype'   # pango requires cairo with freetype
  depends_on 'fontconfig' # pango requires cairo with fontconfig

  def self.build
    system "./configure --disable-xlib --libdir=#{CREW_LIB_PREFIX}"
    system "make"
  end

  def self.install
    system "make", "DESTDIR=#{CREW_DEST_DIR}", "install"
  end
end
