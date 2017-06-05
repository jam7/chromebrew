require 'package'

class Gmp < Package
  description 'GMP is a free library for arbitrary precision arithmetic, operating on signed integers, rational numbers, and floating-point numbers.'
  homepage 'https://gmplib.org/'
  version "6.1.2-cc1.5"
  binary_url ({
    aarch64: 'https://github.com/jam7/chrome-cross/releases/download/v1.5/gmp-6.1.2-cc1.5-chromeos-armv7l.tar.xz',
    armv7l:  'https://github.com/jam7/chrome-cross/releases/download/v1.5/gmp-6.1.2-cc1.5-chromeos-armv7l.tar.xz',
    i686:    'https://github.com/jam7/chrome-cross/releases/download/v1.5/gmp-6.1.2-cc1.5-chromeos-i686.tar.xz',
    x86_64:  'https://github.com/jam7/chrome-cross/releases/download/v1.5/gmp-6.1.2-cc1.5-chromeos-x86_64.tar.xz',
  })
  binary_sha1 ({
    aarch64: 'da71a043e69851ea99171e9125c1ea88ee0e198c',
    armv7l:  'da71a043e69851ea99171e9125c1ea88ee0e198c',
    i686:    '6f588dc48ab941647c46f871c243e23544250f34',
    x86_64:  'd59f186e8949cbf3abe8fb45c7ff6e3c6c586b81',
  })
end
