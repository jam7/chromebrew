require 'package'

class Pango < Package
  description 'Pango is a library for laying out and rendering of text, with an emphasis on internationalization.'
  homepage 'http://www.pango.org/'
  version '1.40.9-1'
  source_url 'https://ftp.gnome.org/pub/gnome/sources/pango/1.40/pango-1.40.9.tar.xz'
  source_sha256 '9faea6535312fe4436b93047cf7a04af544eb52a079179bd3a33821aacce7e16'

  binary_url ({
    aarch64: 'https://dl.bintray.com/chromebrew/chromebrew/pango-1.40.9-1-chromeos-armv7l.tar.xz',
     armv7l: 'https://dl.bintray.com/chromebrew/chromebrew/pango-1.40.9-1-chromeos-armv7l.tar.xz',
       i686: 'https://dl.bintray.com/chromebrew/chromebrew/pango-1.40.9-1-chromeos-i686.tar.xz',
     x86_64: 'https://dl.bintray.com/chromebrew/chromebrew/pango-1.40.9-1-chromeos-x86_64.tar.xz',
  })
  binary_sha256 ({
    aarch64: '4902695acc6e9aea1494e9c17cbbd0ced31ea8953b0d9e581360deac16b28e13',
     armv7l: '4902695acc6e9aea1494e9c17cbbd0ced31ea8953b0d9e581360deac16b28e13',
       i686: '780bd7330d1838c9ddc3a56d108b4df3eb6be504d81a55341c3fa912e9343b51',
     x86_64: '31fdfd33e677baeb4b9cf4cff7764a1e2219b9a1ca54340f488c83780b243e16',
  })

  depends_on 'harfbuzz'
  depends_on 'cairo'
  depends_on 'glib'

  def self.build
    system "./configure --libdir=#{CREW_LIB_PREFIX}"
    system "make"
  end

  def self.install
    system "make", "DESTDIR=#{CREW_DEST_DIR}", "install"
  end
end
