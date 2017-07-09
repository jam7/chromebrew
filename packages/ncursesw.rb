require 'package'

class Ncursesw < Package
  description 'ncurses wide-character libraries.'
  homepage 'http://www.gnu.org/software/ncurses/'
  version '6.0-2'
  source_url 'ftp://ftp.gnu.org/pub/gnu/ncurses/ncurses-6.0.tar.gz'
  source_sha256 'f551c24b30ce8bfb6e96d9f59b42fbea30fa3a6123384172f9e7284bcf647260'
  binary_url ({
    aarch64: 'https://github.com/jam7/chrome-cross/releases/download/v1.8/ncursesw-5.9-chromeos-armv7l.tar.xz',
    armv7l:  'https://github.com/jam7/chrome-cross/releases/download/v1.8/ncursesw-5.9-chromeos-armv7l.tar.xz',
    i686:    'https://github.com/jam7/chrome-cross/releases/download/v1.8/ncursesw-5.9-chromeos-i686.tar.xz',
    x86_64:  'https://github.com/jam7/chrome-cross/releases/download/v1.8/ncursesw-5.9-chromeos-x86_64.tar.xz',
  })
  binary_sha256 ({
    aarch64: '86f8d8e4899752c511d59c00f63b450f2e3f4949a2169cb7a9620eb3863c8824',
    armv7l:  '86f8d8e4899752c511d59c00f63b450f2e3f4949a2169cb7a9620eb3863c8824',
    i686:    'ac5c1b4f86aa8efa2b86dc3a26396509ee824f6f09c9a6087403f04ea624aa0e',
    x86_64:  '384f432ba9b7c73ae4c779860a8fd7eca7d45a51092f72959c63fbe43edcad70',
  })

  depends_on 'diffutils' => :build

  def self.build
    # Check ncurses doesn't conflict with ncrusesw
    if File.exist? CREW_CONFIG_PATH + "meta/ncurses.filelist"
      if `grep include/ncursesw #{CREW_CONFIG_PATH}meta/ncurses.filelist` != ''
        puts
        puts "PLEASE PERFORM `crew upgrade ncurses` OR `crew remove ncurses` FIRST"
        puts
        exit 1
      end
    end
    # Build ncursesw
    system './configure',
           '--prefix=/usr/local',
           "--libdir=#{CREW_LIB_PREFIX}",
           '--without-normal',
           '--with-shared',
           '--with-cxx-shared',
           '--without-debug',
           '--enable-widec'
    system 'make'
  end

  def self.install
    system "make", "DESTDIR=#{CREW_DEST_DIR}", "install"

    # remove binary files which are installed by ncurses also
    system "rm", "#{CREW_DEST_DIR}/usr/local/bin/clear"
    system "rm", "#{CREW_DEST_DIR}/usr/local/bin/infocmp"
    system "rm", "#{CREW_DEST_DIR}/usr/local/bin/tabs"
    system "rm", "#{CREW_DEST_DIR}/usr/local/bin/tic"
    system "rm", "#{CREW_DEST_DIR}/usr/local/bin/tput"
    system "rm", "#{CREW_DEST_DIR}/usr/local/bin/tset"
    system "rm", "#{CREW_DEST_DIR}/usr/local/bin/toe"
  end
end
