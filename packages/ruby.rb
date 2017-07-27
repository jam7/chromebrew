require 'package'

class Ruby < Package
  description 'Ruby is a dynamic, open source programming language with a focus on simplicity and productivity.'
  homepage 'https://www.ruby-lang.org/en/'
  version '2.4.1'
  source_url 'https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.1.tar.xz'
  source_sha256 '4fc8a9992de3e90191de369270ea4b6c1b171b7941743614cc50822ddc1fe654'
  binary_url ({
    aarch64: 'https://github.com/jam7/chrome-cross/releases/download/v1.8/ruby-2.4.1-chromeos-armv7l.tar.xz',
    armv7l:  'https://github.com/jam7/chrome-cross/releases/download/v1.8/ruby-2.4.1-chromeos-armv7l.tar.xz',
    i686:    'https://github.com/jam7/chrome-cross/releases/download/v1.8/ruby-2.4.1-chromeos-i686.tar.xz',
    x86_64:  'https://github.com/jam7/chrome-cross/releases/download/v1.8/ruby-2.4.1-chromeos-x86_64.tar.xz',
  })
  binary_sha256 ({
    aarch64: '6c0ef23447d4591739dc00fa9b021a4d83291acbc37330e659d257efed474caf',
    armv7l:  '6c0ef23447d4591739dc00fa9b021a4d83291acbc37330e659d257efed474caf',
    i686:    '851a40ca3860eadfe21a1b77422f8769497a73fd1f275d370e3874948ddb64bd',
    x86_64:  'fb15f0d6b8d02acf525ae5efe59fc7b9bc19908123c47d39559bc6e86fe1d655',
  })

  depends_on 'readline'
  depends_on 'ncurses'
  depends_on 'zlibpkg' => :build
  depends_on 'openssl' => :build
  # at run-time, system's gmp, openssl, readline and zlibpkg are possible to use

  def self.build
    system "CC='gcc' ./configure --libdir=#{CREW_LIB_PREFIX} --enable-shared"
    system "make"
  end

  def self.install
    system "make", "DESTDIR=#{CREW_DEST_DIR}", "install"
  end

  def self.check
    system "TMPDIR=/usr/local/tmp make check"
  end
end
