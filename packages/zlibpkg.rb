require 'package'

class Zlibpkg < Package
  description 'zlib is a massively spiffy yet delicately unobtrusive compression library.'
  homepage 'http://www.zlib.net/'
  version '1.2.11-1'
  source_url 'http://www.zlib.net/zlib-1.2.11.tar.gz'
  source_sha256 'c3e5e9fdd5004dcb542feda5ee4f0ff0744628baf8ed2dd5d66f8ca1197cb1a1'
  binary_url ({
    aarch64: 'https://github.com/jam7/chrome-cross/releases/download/v1.8/zlib-1.2.11-chromeos-armv7l.tar.xz',
    armv7l:  'https://github.com/jam7/chrome-cross/releases/download/v1.8/zlib-1.2.11-chromeos-armv7l.tar.xz',
    i686:    'https://github.com/jam7/chrome-cross/releases/download/v1.8/zlib-1.2.11-chromeos-i686.tar.xz',
    x86_64:  'https://github.com/jam7/chrome-cross/releases/download/v1.8/zlib-1.2.11-chromeos-x86_64.tar.xz',
  })
  binary_sha256 ({
    aarch64: '6871ea3f8c29969df45191df34d0d3d94f4e535d91a6c668956da9a2f25334f9',
    armv7l:  '6871ea3f8c29969df45191df34d0d3d94f4e535d91a6c668956da9a2f25334f9',
    i686:    '5a33575282060a0fcb560c22a33dd2ea26cbfe2f34f194df66fd36a4a83ab9df',
    x86_64:  'fe9eadf9987846b637cd0d83bd4c07c53ae976538d533b7b3657c770372bc5d4',
  })

  def self.build
    system "./configure", "--libdir=#{CREW_LIB_PREFIX}"
    system "make"
  end

  def self.install
    system "make", "DESTDIR=#{CREW_DEST_DIR}", "install"

    # remove static library since there is no configuration option to not create it.
    system "rm", "#{CREW_DEST_DIR}#{CREW_LIB_PREFIX}/libz.a"
  end

  def self.check
    system "make check"
  end
end
