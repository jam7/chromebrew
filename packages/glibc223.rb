require 'package'

class Glibc223 < Package
  description 'GNU C Library'
  homepage 'https://www.gnu.org/software/libc/'
  version '2.23-cc1.5'
  binary_url ({
    aarch64: 'https://github.com/jam7/chrome-cross/releases/download/v1.5/glibc-2.23-cc1.5-chromeos-armv7l.tar.xz',
    armv7l:  'https://github.com/jam7/chrome-cross/releases/download/v1.5/glibc-2.23-cc1.5-chromeos-armv7l.tar.xz',
    i686:    'https://github.com/jam7/chrome-cross/releases/download/v1.5/glibc-2.23-cc1.5-chromeos-i686.tar.xz',
    x86_64:  'https://github.com/jam7/chrome-cross/releases/download/v1.5/glibc-2.23-cc1.5-chromeos-x86_64.tar.xz',
  })
  binary_sha1 ({
    aarch64: '1879d7699766ba56a65d3044f73972928f3c7b9c',
    armv7l:  '1879d7699766ba56a65d3044f73972928f3c7b9c',
    i686:    '6f23d2ccd0baddada88fc0285ae90a0f55b98f1f',
    x86_64:  'f051c7e81ce7d4819d779d3f49a32cefb87db695',
  })
end
