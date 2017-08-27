require 'package'

class Harfbuzz < Package
  description 'HarfBuzz is an OpenType text shaping engine.'
  homepage 'https://www.freedesktop.org/wiki/Software/HarfBuzz/'
  version '1.4.8-1'
  source_url 'https://github.com/behdad/harfbuzz/releases/download/1.4.8/harfbuzz-1.4.8.tar.bz2'
  source_sha256 'ccec4930ff0bb2d0c40aee203075447954b64a8c2695202413cc5e428c907131'

  binary_url ({
    aarch64: 'https://dl.bintray.com/chromebrew/chromebrew/harfbuzz-1.4.8-1-chromeos-armv7l.tar.xz',
     armv7l: 'https://dl.bintray.com/chromebrew/chromebrew/harfbuzz-1.4.8-1-chromeos-armv7l.tar.xz',
       i686: 'https://dl.bintray.com/chromebrew/chromebrew/harfbuzz-1.4.8-1-chromeos-i686.tar.xz',
     x86_64: 'https://dl.bintray.com/chromebrew/chromebrew/harfbuzz-1.4.8-1-chromeos-x86_64.tar.xz',
  })
  binary_sha256 ({
    aarch64: '57b13a68bb651f36ab6918f32dc5656bf6efe4855b5a7a0132f683fea12eb8fa',
     armv7l: '57b13a68bb651f36ab6918f32dc5656bf6efe4855b5a7a0132f683fea12eb8fa',
       i686: 'e77a016c6e51db694fba02b4f8f42667bbdebcce4eb0f5a0612bfa9940ffd8a9',
     x86_64: '37eb4a8b5114e1e2e5a4334f91be6fcaffa2f4a5e42a3df30cecf542c6a889b4',
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
