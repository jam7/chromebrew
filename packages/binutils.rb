require 'package'

class Binutils < Package
  description 'The GNU Binutils are a collection of binary tools.'
  homepage 'http://www.gnu.org/software/binutils/'
  version '2.25-cc1.5'
  binary_url ({
    aarch64: 'https://github.com/jam7/chrome-cross/releases/download/v1.5/binutils-2.25-cc1.5-chromeos-armv7l.tar.xz',
    armv7l:  'https://github.com/jam7/chrome-cross/releases/download/v1.5/binutils-2.25-cc1.5-chromeos-armv7l.tar.xz',
    i686:    'https://github.com/jam7/chrome-cross/releases/download/v1.5/binutils-2.25-cc1.5-chromeos-i686.tar.xz',
    x86_64:  'https://github.com/jam7/chrome-cross/releases/download/v1.5/binutils-2.25-cc1.5-chromeos-x86_64.tar.xz',
  })
  binary_sha1 ({
    aarch64: 'e5fcf12faf0d252a40f4ec4dca5b0dc4025d6ac1',
    armv7l:  'e5fcf12faf0d252a40f4ec4dca5b0dc4025d6ac1',
    i686:    '4981e0aa1218700893b30aab10d2015e3cd8bc3d',
    x86_64:  '4e392c0cb559fc4231424ac0d4e993c659521898',
  })
end
