require 'package'

class Freetype < Package
  description 'FreeType is a freely available software library to render fonts.'
  homepage 'https://www.freetype.org/'
  version '2.8-1'
  source_url 'http://download.savannah.gnu.org/releases/freetype/freetype-2.8.tar.bz2'
  source_sha256 'a3c603ed84c3c2495f9c9331fe6bba3bb0ee65e06ec331e0a0fb52158291b40b'

  binary_url ({
  })
  binary_sha256 ({
  })

  depends_on 'expat'

  def self.build
      system "./configure --libdir=#{CREW_LIB_PREFIX}"
      system "make"
  end

  def self.install
    system "make", "DESTDIR=#{CREW_DEST_DIR}", "install"
  end
end
