require 'package'

class Ncurses < Package
  description 'The ncurses (new curses) library is a free software emulation of curses in System V Release 4.0 (SVr4), and more.'
  homepage 'https://www.gnu.org/software/ncurses/'
  version '6.0-2'
  source_url 'ftp://ftp.gnu.org/pub/gnu/ncurses/ncurses-6.0.tar.gz'
  source_sha256 'f551c24b30ce8bfb6e96d9f59b42fbea30fa3a6123384172f9e7284bcf647260'
  binary_url ({
    aarch64: 'https://github.com/jam7/chrome-cross/releases/download/v1.8/ncurses-5.9-chromeos-armv7l.tar.xz',
    armv7l:  'https://github.com/jam7/chrome-cross/releases/download/v1.8/ncurses-5.9-chromeos-armv7l.tar.xz',
    i686:    'https://github.com/jam7/chrome-cross/releases/download/v1.8/ncurses-5.9-chromeos-i686.tar.xz',
    x86_64:  'https://github.com/jam7/chrome-cross/releases/download/v1.8/ncurses-5.9-chromeos-x86_64.tar.xz',
  })
  binary_sha256 ({
    aarch64: '2a8c364a13432cdb2712bdb67e6b960587267763c84f1d4165e85e55a9139435',
    armv7l:  '2a8c364a13432cdb2712bdb67e6b960587267763c84f1d4165e85e55a9139435',
    i686:    '8438b6dc8cb51a3fa9fc0f9f4dca3cbcc92c65cecb672c820aee1b1f2a012a04',
    x86_64:  '197df39f0b78c303f5f9d4c1b85f39628b0df4129ffca5dd727d5dc0a351ce1b',
  })

  depends_on 'diffutils' => :build
  depends_on 'ncursesw'

  def self.build
    system './configure',
           '--prefix=/usr/local',
           "--libdir=#{CREW_LIB_PREFIX}",
           '--without-normal',
           '--with-shared',
           '--with-cxx-shared',
           '--without-debug'
    system 'make'
  end

  def self.install
    system "make", "DESTDIR=#{CREW_DEST_DIR}", "install"
  end
end
