require 'package'

class Make < Package
  description 'GNU Make is a tool which controls the generation of executables and other non-source files of a program from the program\'s source files.'
  homepage 'https://www.gnu.org/software/make/'
  version '4.2'
  source_url 'ftp://ftp.gnu.org/gnu/make/make-4.2.tar.bz2'
  source_sha256 '4e5ce3b62fe5d75ff8db92b7f6df91e476d10c3aceebf1639796dc5bfece655f'
  binary_url ({
    aarch64: 'https://github.com/jam7/chrome-cross/releases/download/v1.8/make-4.2-chromeos-armv7l.tar.xz',
    armv7l:  'https://github.com/jam7/chrome-cross/releases/download/v1.8/make-4.2-chromeos-armv7l.tar.xz',
    i686:    'https://github.com/jam7/chrome-cross/releases/download/v1.8/make-4.2-chromeos-i686.tar.xz',
    x86_64:  'https://github.com/jam7/chrome-cross/releases/download/v1.8/make-4.2-chromeos-x86_64.tar.xz',
  })
  binary_sha256 ({
    aarch64: '974c2fdedc98b43feecd7e78e4d61f3b38e2a381cfcea52735ee520c0059d32b',
    armv7l:  '974c2fdedc98b43feecd7e78e4d61f3b38e2a381cfcea52735ee520c0059d32b',
    i686:    'f36a52563c1d91371f4a2740d63e429f7936a37aea624b9e7156472f64ef5db9',
    x86_64:  'c8ebc6c73474a27e3c0b83d328b77a8bcfdfdf779f5e9d5ee1831fab689d81aa',
  })

  depends_on 'gcc' => :build
  depends_on 'linuxheaders' => :build

  def self.build
    system "./configure"
    system "./build.sh"
  end

  def self.install
    system "./make", "DESTDIR=#{CREW_DEST_DIR}", "install"
  end

  def self.check
    # Give it several tries since output-sync fails rarely
    system "./make check || ./make check || ./make check"
  end
end
