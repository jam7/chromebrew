require 'package'

class Harfbuzz < Package
  description 'HarfBuzz is an OpenType text shaping engine.'
  homepage 'https://www.freedesktop.org/wiki/Software/HarfBuzz/'
  version '1.4.8-1'
  source_url 'https://github.com/behdad/harfbuzz/releases/download/1.4.8/harfbuzz-1.4.8.tar.bz2'
  source_sha256 'ccec4930ff0bb2d0c40aee203075447954b64a8c2695202413cc5e428c907131'

  binary_url ({
  })
  binary_sha256 ({
  })

  depends_on 'glib'
  depends_on 'icu4c'
  depends_on 'freetype'

  def self.build
    system "./configure --libdir=#{CREW_LIB_PREFIX}"
    system "make"
  end

  def self.install
    system "make", "DESTDIR=#{CREW_DEST_DIR}", "install"
  end
end
