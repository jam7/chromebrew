require 'package'

class Fontconfig < Package
  description 'Fontconfig is a library for configuring and customizing font access.'
  homepage 'https://www.freedesktop.org/software/fontconfig/front.html'
  version '2.12.4-1'
  source_url 'https://www.freedesktop.org/software/fontconfig/release/fontconfig-2.12.4.tar.bz2'
  source_sha256 '668293fcc4b3c59765cdee5cee05941091c0879edcc24dfec5455ef83912e45c'

  binary_url ({
    aarch64: 'https://dl.bintray.com/chromebrew/chromebrew/fontconfig-2.12.4-1-chromeos-armv7l.tar.xz',
     armv7l: 'https://dl.bintray.com/chromebrew/chromebrew/fontconfig-2.12.4-1-chromeos-armv7l.tar.xz',
       i686: 'https://dl.bintray.com/chromebrew/chromebrew/fontconfig-2.12.4-1-chromeos-i686.tar.xz',
     x86_64: 'https://dl.bintray.com/chromebrew/chromebrew/fontconfig-2.12.4-1-chromeos-x86_64.tar.xz',
  })
  binary_sha256 ({
    aarch64: '6fbb8830f34adf34dd3efc4380d308cab0af4034c065fdae08b969202d2dff42',
     armv7l: '6fbb8830f34adf34dd3efc4380d308cab0af4034c065fdae08b969202d2dff42',
       i686: 'd8c8c10d4dff0a7657f1787728c49e367004869be7fca5ef79f80acbea506056',
     x86_64: 'bfe4075a713324eda791ec94ef0918c8ff5b18efe3d4e20a64cdb976c969d9e5',
  })

  depends_on 'expat'
  depends_on 'gperf'
  depends_on 'pkgconfig'
  depends_on 'freetype'

  def self.build
      system "./configure --libdir=#{CREW_LIB_PREFIX}"
      system 'make'
  end

  def self.install
    system "make", "DESTDIR=#{CREW_DEST_DIR}", "install"
  end
end
