require 'package'

class Gcc < Package
  description 'The GNU Compiler Collection includes front ends for C, C++, Objective-C, Fortran, Ada, and Go.'
  homepage 'https://www.gnu.org/software/gcc/'
  version '7.1.0-cc1.5'

  binary_url ({
    aarch64: 'https://github.com/jam7/chrome-cross/releases/download/v1.5/gcc-7.1.0-cc1.5-chromeos-armv7l.tar.xz',
    armv7l:  'https://github.com/jam7/chrome-cross/releases/download/v1.5/gcc-7.1.0-cc1.5-chromeos-armv7l.tar.xz',
    i686:    'https://github.com/jam7/chrome-cross/releases/download/v1.5/gcc-7.1.0-cc1.5-chromeos-i686.tar.xz',
    x86_64:  'https://github.com/jam7/chrome-cross/releases/download/v1.5/gcc-7.1.0-cc1.5-chromeos-x86_64.tar.xz',
  })
  binary_sha1 ({
    aarch64: 'ff9b41e702e1c4347b91449fb231bafa856b6b82',
    armv7l:  'ff9b41e702e1c4347b91449fb231bafa856b6b82',
    i686:    '979aa5c3246dfb444fcb58e717c1804672e3a14a',
    x86_64:  '165ae95f6e845e8fcf0c79779ea2e3d6d4a815ab',
  })

  depends_on 'binutils'
  depends_on 'gmp'
  depends_on 'mpfr'
  depends_on 'mpc'
  depends_on 'isl'
  depends_on 'cloog'
  depends_on 'glibc'
end
