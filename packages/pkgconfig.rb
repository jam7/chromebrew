require 'package'

class Pkgconfig < Package
  description 'pkg-config is a helper tool used when compiling applications and libraries.'
  homepage 'https://www.freedesktop.org/wiki/Software/pkg-config/'
  version '0.29.2'
  source_url 'http://pkgconfig.freedesktop.org/releases/pkg-config-0.29.2.tar.gz'
  source_sha256 '6fc69c01688c9458a57eb9a1664c9aba372ccda420a02bf4429fe610e7e7d591'
  binary_url ({
    aarch64: 'https://github.com/jam7/chrome-cross/releases/download/v1.8/pkgconfig-0.29.2-chromeos-armv7l.tar.xz',
    armv7l:  'https://github.com/jam7/chrome-cross/releases/download/v1.8/pkgconfig-0.29.2-chromeos-armv7l.tar.xz',
    i686:    'https://github.com/jam7/chrome-cross/releases/download/v1.8/pkgconfig-0.29.2-chromeos-i686.tar.xz',
    x86_64:  'https://github.com/jam7/chrome-cross/releases/download/v1.8/pkgconfig-0.29.2-chromeos-x86_64.tar.xz',
  })
  binary_sha256 ({
    aarch64: '70bc2e578b92f545e94639def2ee00ffd551add654a8164744024d57d00cd55e',
    armv7l:  '70bc2e578b92f545e94639def2ee00ffd551add654a8164744024d57d00cd55e',
    i686:    '791f257273f0597bdcb5cbe0f408b6c5a91c18f666c21056ee72fb39359e74e5',
    x86_64:  'a8f28bf9abec237730ceef11f8605c88bc97bcc4a59a9b1aa520c91c4217cea4',
  })

  # It is not possible to write buildessential here since it causes dependency loop.
  #   depends_on 'buildessential'
  # Write dependency to gcc make linuxheaders instead.
  depends_on 'gcc'
  depends_on 'linuxheaders'
  depends_on 'make'

  def self.build
      # check lib64 on any architectures since it is not a problem to not exist lib64 directory.
      system "./configure", "--with-internal-glib", "--with-pc-path=/usr/local/lib/pkgconfig:/usr/local/lib64/pkgconfig:/usr/local/share/pkgconfig"
      system "make"
  end

  def self.install
    system "make", "DESTDIR=#{CREW_DEST_DIR}", "install"
  end

  def self.check
    system "make", "check"
  end
end
