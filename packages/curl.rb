require 'package'

class Curl < Package
  description 'Command line tool and library for transferring data with URLs.'
  homepage 'https://curl.haxx.se/'
  version '7.54.1'
  source_url 'https://curl.haxx.se/download/curl-7.54.1.tar.bz2'
  source_sha256 'fdfc4df2d001ee0c44ec071186e770046249263c491fcae48df0e1a3ca8f25a0'
  binary_url ({
    aarch64: 'https://github.com/jam7/chrome-cross/releases/download/v1.8/curl-7.54.1-chromeos-armv7l.tar.xz',
    armv7l:  'https://github.com/jam7/chrome-cross/releases/download/v1.8/curl-7.54.1-chromeos-armv7l.tar.xz',
    i686:    'https://github.com/jam7/chrome-cross/releases/download/v1.8/curl-7.54.1-chromeos-i686.tar.xz',
    x86_64:  'https://github.com/jam7/chrome-cross/releases/download/v1.8/curl-7.54.1-chromeos-x86_64.tar.xz',
  })
  binary_sha256 ({
    aarch64: 'a4e20f96eb21adf6acfcacffa5ea6cf30765e3146cb6326660a1e1a40c25381f',
    armv7l:  'a4e20f96eb21adf6acfcacffa5ea6cf30765e3146cb6326660a1e1a40c25381f',
    i686:    'e25ef8822c7d5d2a58ef22f7130c348e152e6cec4a6a0512ad4a38a31ef1d07c',
    x86_64:  '9840d2be7063109cc854296db2bfde63b6777d50016f50a5fb029bb6c685f0bd',
  })

  depends_on 'openssl' => :build
  depends_on 'zlibpkg' => :build
  depends_on 'libssh2'
  depends_on 'groff' => :build

  def self.build
    system "./configure", "--libdir=#{CREW_LIB_PREFIX}", "--disable-static"
    system "make"
  end

  def self.install
    system "make", "DESTDIR=#{CREW_DEST_DIR}", "install"
  end

  def self.check
    system "make", "test"
  end
end
