require 'package'

class Icu4c < Package
  description 'ICU is a mature, widely used set of C/C++ and Java libraries providing Unicode and Globalization support for software applications.'
  homepage 'http://site.icu-project.org/'
  version '58.2-1'
  source_url 'http://download.icu-project.org/files/icu4c/58.2/icu4c-58_2-src.tgz'
  source_sha256 '2b0a4410153a9b20de0e20c7d8b66049a72aef244b53683d0d7521371683da0c'

  binary_url ({
    aarch64: 'https://dl.bintray.com/chromebrew/chromebrew/icu4c-58.2-1-chromeos-armv7l.tar.xz',
     armv7l: 'https://dl.bintray.com/chromebrew/chromebrew/icu4c-58.2-1-chromeos-armv7l.tar.xz',
       i686: 'https://dl.bintray.com/chromebrew/chromebrew/icu4c-58.2-1-chromeos-i686.tar.xz',
     x86_64: 'https://dl.bintray.com/chromebrew/chromebrew/icu4c-58.2-1-chromeos-x86_64.tar.xz',
  })
  binary_sha256 ({
    aarch64: '5a36b72893593fe20cf0c738e477be0f6d722361326040e7b7ea4aa264ee3837',
     armv7l: '5a36b72893593fe20cf0c738e477be0f6d722361326040e7b7ea4aa264ee3837',
       i686: '7a0fa1e1a9976ca655653e22bb9b89b18f15b70c729345a628ee9b7f6dce2479',
     x86_64: '22c335ce93d312f72b8bf8099c6cc785596141e750c3b6179645bbfb24861ac7',
  })

  def self.build
    FileUtils.cd('source') do
      case ARCH
      when 'aarch64', 'armv7l'
        # Armhf requires sane ELF headers rather than other architectures as
        # discussed in https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=653457
        system "sed -e '/LDFLAGSICUDT=/cLDFLAGSICUDT=' -i config/mh-linux"
      end
      system "./configure", "--without-samples", "--without-tests", "--libdir=#{CREW_LIB_PREFIX}"
      system "make"
    end
  end

  def self.install
    FileUtils.cd('source') do
      system "make", "DESTDIR=#{CREW_DEST_DIR}", "install"
    end
  end
end
