require 'package'

class Readline < Package
  description 'The GNU Readline library provides a set of functions for use by applications that allow users to edit command lines as they are typed in.'
  homepage 'http://cnswww.cns.cwru.edu/php/chet/readline/rltop.html'
  version '6.3p8'
  source_url 'http://ftp.gnu.org/gnu/readline/readline-6.3.tar.gz'
  source_sha256 '56ba6071b9462f980c5a72ab0023893b65ba6debb4eeb475d7a563dc65cafd43'
  binary_url ({
    aarch64: 'https://github.com/jam7/chrome-cross/releases/download/v1.8/readline-6.3p8-chromeos-armv7l.tar.xz',
    armv7l:  'https://github.com/jam7/chrome-cross/releases/download/v1.8/readline-6.3p8-chromeos-armv7l.tar.xz',
    i686:    'https://github.com/jam7/chrome-cross/releases/download/v1.8/readline-6.3p8-chromeos-i686.tar.xz',
    x86_64:  'https://github.com/jam7/chrome-cross/releases/download/v1.8/readline-6.3p8-chromeos-x86_64.tar.xz',
  })
  binary_sha256 ({
    aarch64: '4f7b9806c57f7b9f45e2aeebacb8286c2a18efb1b10afeb81701d11a128b8ec3',
    armv7l:  '4f7b9806c57f7b9f45e2aeebacb8286c2a18efb1b10afeb81701d11a128b8ec3',
    i686:    '069b049b51a6416d2eec00bd22090d760b77c1b13694ac19d81862a8a597506d',
    x86_64:  'bc285b1f55268b7b9277031efe46059be5ce901b9ef9cc91c4905e64868d37f4',
  })

  depends_on 'buildessential' => :build
  depends_on 'patch' => :build
  depends_on 'ncurses'

  def self.build
    system "wget -r -N -nd --no-parent ftp://ftp.gnu.org/gnu/readline/readline-6.3-patches/readline63-001 -P readline-6.3-patches"
    system "wget -r -N -nd --no-parent ftp://ftp.gnu.org/gnu/readline/readline-6.3-patches/readline63-002 -P readline-6.3-patches"
    system "wget -r -N -nd --no-parent ftp://ftp.gnu.org/gnu/readline/readline-6.3-patches/readline63-003 -P readline-6.3-patches"
    system "wget -r -N -nd --no-parent ftp://ftp.gnu.org/gnu/readline/readline-6.3-patches/readline63-004 -P readline-6.3-patches"
    system "wget -r -N -nd --no-parent ftp://ftp.gnu.org/gnu/readline/readline-6.3-patches/readline63-005 -P readline-6.3-patches"
    system "wget -r -N -nd --no-parent ftp://ftp.gnu.org/gnu/readline/readline-6.3-patches/readline63-006 -P readline-6.3-patches"
    system "wget -r -N -nd --no-parent ftp://ftp.gnu.org/gnu/readline/readline-6.3-patches/readline63-007 -P readline-6.3-patches"
    system "wget -r -N -nd --no-parent ftp://ftp.gnu.org/gnu/readline/readline-6.3-patches/readline63-008 -P readline-6.3-patches"
    # system "for i in readline-6.3-patches/*.sig; do gpg $i; done"
    system "for i in readline-6.3-patches/readline63-???; do patch < $i; done"

    system "CC='gcc' ./configure --libdir=#{CREW_LIB_PREFIX} --disable-static --with-curses"
    system "make"
  end

  def self.install
    system "make", "DESTDIR=#{CREW_DEST_DIR}", "install"
  end
end
