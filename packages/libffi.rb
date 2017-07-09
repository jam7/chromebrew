require 'package'

class Libffi < Package
  description 'The libffi library provides a portable, high level programming interface to various calling conventions.'
  homepage 'https://sourceware.org/libffi/'
  version '3.2.1-2'
  source_url 'ftp://sourceware.org/pub/libffi/libffi-3.2.1.tar.gz'
  source_sha256 'd06ebb8e1d9a22d19e38d63fdb83954253f39bedc5d46232a05645685722ca37'
  binary_url ({
    aarch64: 'https://github.com/jam7/chrome-cross/releases/download/v1.8/libffi-3.2.1-chromeos-armv7l.tar.xz',
    armv7l:  'https://github.com/jam7/chrome-cross/releases/download/v1.8/libffi-3.2.1-chromeos-armv7l.tar.xz',
    i686:    'https://github.com/jam7/chrome-cross/releases/download/v1.8/libffi-3.2.1-chromeos-i686.tar.xz',
    x86_64:  'https://github.com/jam7/chrome-cross/releases/download/v1.8/libffi-3.2.1-chromeos-x86_64.tar.xz',
  })
  binary_sha256 ({
    aarch64: 'ecafdac385df1d6fc3bf477b3400e889d499446d36e7456d005cfbbe2cc9bf12',
    armv7l:  'ecafdac385df1d6fc3bf477b3400e889d499446d36e7456d005cfbbe2cc9bf12',
    i686:    '257f544b86775d26ba631c1c2095560fd823cf879d44230c4d6cd8e982be4b7c',
    x86_64:  '48c9afaa32f7cddd516aef0f3fa83b783e8cca1c0045c85e199222241786082c',
  })

  def self.build
    system "./configure", "--libdir=#{CREW_LIB_PREFIX}", "--enable-shared", "--disable-static", "--with-pic", "--disable-debug", "--disable-dependency-tracking"
    system "make"
  end

  def self.install
    system "make", "DESTDIR=#{CREW_DEST_DIR}", "install"
  end

  def self.check
    # system "make check"         # DejaGNU required
  end
end
