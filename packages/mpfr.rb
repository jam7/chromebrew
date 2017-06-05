require 'package'

class Mpfr < Package
  description 'The MPFR library is a C library for multiple-precision floating-point computations with correct rounding.'
  homepage 'http://www.mpfr.org/'
  version '3.1.5-cc1.5'
  binary_url ({
    aarch64: 'https://github.com/jam7/chrome-cross/releases/download/v1.5/mpfr-3.1.5-cc1.5-chromeos-armv7l.tar.xz',
    armv7l:  'https://github.com/jam7/chrome-cross/releases/download/v1.5/mpfr-3.1.5-cc1.5-chromeos-armv7l.tar.xz',
    i686:    'https://github.com/jam7/chrome-cross/releases/download/v1.5/mpfr-3.1.5-cc1.5-chromeos-i686.tar.xz',
    x86_64:  'https://github.com/jam7/chrome-cross/releases/download/v1.5/mpfr-3.1.5-cc1.5-chromeos-x86_64.tar.xz',
  })
  binary_sha1 ({
    aarch64: '7f5f0eb45e323ca9d9ac5ce3e741bcdeaf49b155',
    armv7l:  '7f5f0eb45e323ca9d9ac5ce3e741bcdeaf49b155',
    i686:    '1fc9e29541e1af49a851b852198253f173e08f9b',
    x86_64:  '472a029f239291bf144b465616dc911bd1719dd0',
  })
end
