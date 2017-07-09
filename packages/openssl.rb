require 'package'

class Openssl < Package
  description 'OpenSSL is an open source project that provides a robust, commercial-grade, and full-featured toolkit for the Transport Layer Security (TLS) and Secure Sockets Layer (SSL) protocols.'
  homepage 'https://www.openssl.org/'
  version '1.0.2l'

  source_url 'https://github.com/openssl/openssl/archive/OpenSSL_1_0_2l.tar.gz'
  source_sha256 'a3d3a7c03c90ba370405b2d12791598addfcafb1a77ef483c02a317a56c08485'
  binary_url ({
    aarch64: 'https://github.com/jam7/chrome-cross/releases/download/v1.8/openssl-1.0.2l-chromeos-armv7l.tar.xz',
    armv7l:  'https://github.com/jam7/chrome-cross/releases/download/v1.8/openssl-1.0.2l-chromeos-armv7l.tar.xz',
    i686:    'https://github.com/jam7/chrome-cross/releases/download/v1.8/openssl-1.0.2l-chromeos-i686.tar.xz',
    x86_64:  'https://github.com/jam7/chrome-cross/releases/download/v1.8/openssl-1.0.2l-chromeos-x86_64.tar.xz',
  })
  binary_sha256 ({
    aarch64: '205dcce05cad0e27349f3b728b7fbc27a3feba0ebcfc7129b48a741f122a08be',
    armv7l:  '205dcce05cad0e27349f3b728b7fbc27a3feba0ebcfc7129b48a741f122a08be',
    i686:    'a439b4e6a03cbfc58ef3fdf52f7d5a11523db08528ff14fd123866c00e32d956',
    x86_64:  'eb3e37f632623a480a57964f1f6ea21d2e48fdac0e2cb67305a805ec24ad4525',
  })

  depends_on 'perl' => :build
  depends_on 'zlibpkg' => :build

  def self.build
    options="shared zlib-dynamic"
    if `uname -m`.strip == 'aarch64'
      options = options + " no-asm"
    end
    system "./config --prefix=/usr/local --openssldir=/etc/ssl #{options}"
    system "make"
  end

  def self.install
    system "make", "INSTALL_PREFIX=#{CREW_DEST_DIR}", "install"
    system "find #{CREW_DEST_DIR}/usr/local -name 'lib*.a' -print | xargs rm"

    # move man to /usr/local/man
    system "mv", "#{CREW_DEST_DIR}/etc/ssl/man", "#{CREW_DEST_DIR}/usr/local/man"

    # remove all files pretended to install /etc/ssl (use system's /etc/ssl as is)
    system "rm", "-rf", "#{CREW_DEST_DIR}/etc"
  end

  def self.check
    system "make", "test"
  end
end
