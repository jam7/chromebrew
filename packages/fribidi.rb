require 'package'

class Fribidi < Package
  description 'GNU FriBidi is an implementation of the Unicode Bidirectional Algorithm (bidi).'
  homepage 'https://www.fribidi.org/'
  version '0.19.7-1'
  source_url 'https://www.fribidi.org/download/fribidi-0.19.7.tar.bz2'
  source_sha256 '08222a6212bbc2276a2d55c3bf370109ae4a35b689acbc66571ad2a670595a8e'

  binary_url ({
    aarch64: 'https://dl.bintray.com/chromebrew/chromebrew/fribidi-0.19.7-1-chromeos-armv7l.tar.xz',
     armv7l: 'https://dl.bintray.com/chromebrew/chromebrew/fribidi-0.19.7-1-chromeos-armv7l.tar.xz',
       i686: 'https://dl.bintray.com/chromebrew/chromebrew/fribidi-0.19.7-1-chromeos-i686.tar.xz',
     x86_64: 'https://dl.bintray.com/chromebrew/chromebrew/fribidi-0.19.7-1-chromeos-x86_64.tar.xz',
  })
  binary_sha256 ({
    aarch64: 'd8bc9c30f26344f64b088800e639adc4350b23528a979c4bbec5ddfc4c0f7dbf',
     armv7l: 'd8bc9c30f26344f64b088800e639adc4350b23528a979c4bbec5ddfc4c0f7dbf',
       i686: '6efd2e5a0d48a06fb74ee33c6a63e90f1fe528ae321bc9e534e4f5fb2567bc95',
     x86_64: 'af865660ffce280239fc49890e706b5c0f0abaedf2cdbfd88d9881280a8e4d73',
  })

  def self.build
    system "./configure --libdir=#{CREW_LIB_PREFIX}"
    system "make"
  end

  def self.install
    system "make", "DESTDIR=#{CREW_DEST_DIR}", "install"
  end
end
