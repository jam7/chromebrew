require 'package'

class Freetype < Package
  description 'FreeType is a freely available software library to render fonts.'
  homepage 'https://www.freetype.org/'
  version '2.8-1'
  source_url 'http://download.savannah.gnu.org/releases/freetype/freetype-2.8.tar.bz2'
  source_sha256 'a3c603ed84c3c2495f9c9331fe6bba3bb0ee65e06ec331e0a0fb52158291b40b'

  binary_url ({
    aarch64: 'https://dl.bintray.com/chromebrew/chromebrew/freetype-2.8-1-chromeos-armv7l.tar.xz',
     armv7l: 'https://dl.bintray.com/chromebrew/chromebrew/freetype-2.8-1-chromeos-armv7l.tar.xz',
       i686: 'https://dl.bintray.com/chromebrew/chromebrew/freetype-2.8-1-chromeos-i686.tar.xz',
     x86_64: 'https://dl.bintray.com/chromebrew/chromebrew/freetype-2.8-1-chromeos-x86_64.tar.xz',
  })
  binary_sha256 ({
    aarch64: 'b79bdc5275401dcfe95df8f5b992d7186c2afb14b328014f5ea2f9b498351632',
     armv7l: 'b79bdc5275401dcfe95df8f5b992d7186c2afb14b328014f5ea2f9b498351632',
       i686: '6b5a15361d0634c4fc89824a65d18d880199c53762dcb85e910a6194c04bf003',
     x86_64: '64afeeb6afc0fd58f0ef14c25c51145d1f0e35e4d25bccd3fce4c53cf9924e1d',
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
