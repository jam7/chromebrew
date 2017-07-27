require 'package'

class Libssh2 < Package
  description 'libssh2 is a client-side C library implementing the SSH2 protocol.'
  homepage 'https://www.libssh2.org/'
  version '1.8.0'
  source_url 'https://www.libssh2.org/download/libssh2-1.8.0.tar.gz'
  source_sha256 '39f34e2f6835f4b992cafe8625073a88e5a28ba78f83e8099610a7b3af4676d4'
  binary_url ({
    aarch64: 'https://github.com/jam7/chrome-cross/releases/download/v1.8/libssh2-1.8.0-chromeos-armv7l.tar.xz',
    armv7l:  'https://github.com/jam7/chrome-cross/releases/download/v1.8/libssh2-1.8.0-chromeos-armv7l.tar.xz',
    i686:    'https://github.com/jam7/chrome-cross/releases/download/v1.8/libssh2-1.8.0-chromeos-i686.tar.xz',
    x86_64:  'https://github.com/jam7/chrome-cross/releases/download/v1.8/libssh2-1.8.0-chromeos-x86_64.tar.xz',
  })
  binary_sha256 ({
    aarch64: '94662756e545c73d76c37b2b83dd9852ebe71f4a17fc80d85db0fbaef72d4ca3',
    armv7l:  '94662756e545c73d76c37b2b83dd9852ebe71f4a17fc80d85db0fbaef72d4ca3',
    i686:    '7d6086f80abd3905a82bd34ffd2b811658c1eaf9ac0e63ad73df39d4ce7c3d9d',
    x86_64:  'a5ebeb68c8e04e6587621a09cc43d0a3d7baf0cdb4dd945fd22253a6e0a11846',
  })

  depends_on 'openssl' => :build
  depends_on 'zlibpkg' => :build

  def self.build
    system "./configure", "--libdir=#{CREW_LIB_PREFIX}", "--with-zlib", "--with-openssl", "--with-pic", "--disable-static"
    system "make"
    system "find . -name '*.so.*' -print | xargs strip -S"
  end

  def self.install
    system "make", "DESTDIR=#{CREW_DEST_DIR}", "install"
  end

  def self.check
    # Ignore mansyntax.sh test which checks man page syntax errors.
    # It causes 'col: Invalid or incomplete multibyte or wide character'
    # error at hyphenations.  It is mandb's problem.
    system "sed -i tests/Makefile -e '/TESTS =/s/mansyntax.sh//'"

    system "make", "check"
  end
end
