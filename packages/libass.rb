require 'package'

class Libass < Package
  description 'A portable subtitle renderer for the ASS/SSA (Advanced Substation Alpha/Substation Alpha) subtitle format.'
  homepage 'https://github.com/libass/libass'
  version '0.13.6-1'
  source_url 'https://github.com/libass/libass/archive/0.13.6.tar.gz'
  source_sha256 'de68288397d284a955061b3ecba67152cea74d8ace6222d987dd30091b1534b7'

  binary_url ({
    aarch64: 'https://dl.bintray.com/chromebrew/chromebrew/libass-0.13.6-1-chromeos-armv7l.tar.xz',
     armv7l: 'https://dl.bintray.com/chromebrew/chromebrew/libass-0.13.6-1-chromeos-armv7l.tar.xz',
       i686: 'https://dl.bintray.com/chromebrew/chromebrew/libass-0.13.6-1-chromeos-i686.tar.xz',
     x86_64: 'https://dl.bintray.com/chromebrew/chromebrew/libass-0.13.6-1-chromeos-x86_64.tar.xz',
  })
  binary_sha256 ({
    aarch64: '43b881f172fff8e61e3289d9cb8bd0a5b0f29af00f235e735f40771829bc64b2',
     armv7l: '43b881f172fff8e61e3289d9cb8bd0a5b0f29af00f235e735f40771829bc64b2',
       i686: '09d25b1c91d7f73ecfdfc45ed497616beb11a7ba79bccaaf9ca90317f85ff43e',
     x86_64: '5b19a10aceb960fb1f99f3645c8ba0807557367b095ff98e4d610328da250647',
  })

  depends_on 'automake'
  depends_on 'autoconf'
  depends_on 'freetype'
  depends_on 'fribidi'
  depends_on 'fontconfig'

  def self.build
    system "./autogen.sh"
    system "autoconf"
    system "./configure --libdir=#{CREW_LIB_PREFIX}"
    system "make"
  end

  def self.install
    system "make", "DESTDIR=#{CREW_DEST_DIR}", "install"
  end
end
