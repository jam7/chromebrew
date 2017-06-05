require 'package'

class Linuxheaders < Package
  description 'Linux headers for Chrome OS.'
  homepage ''
  version '3.18-cc1.5'
  binary_url ({
    aarch64: 'https://github.com/jam7/chrome-cross/releases/download/v1.5/linux-headers-3.18-cc1.5-chromeos-armv7l.tar.xz',
    armv7l:  'https://github.com/jam7/chrome-cross/releases/download/v1.5/linux-headers-3.18-cc1.5-chromeos-armv7l.tar.xz',
    i686:    'https://github.com/jam7/chrome-cross/releases/download/v1.5/linux-headers-3.18-cc1.5-chromeos-i686.tar.xz',
    x86_64:  'https://github.com/jam7/chrome-cross/releases/download/v1.5/linux-headers-3.18-cc1.5-chromeos-x86_64.tar.xz',
  })
  binary_sha1 ({
    aarch64: '999eeee559ff88bda563edcfa427c9a3435f8c5c',
    armv7l:  '999eeee559ff88bda563edcfa427c9a3435f8c5c',
    i686:    '23fd13ad79e34afd19eac93ec82076c65ed89c86',
    x86_64:  'd2913f694f039f17201ba41eeb11ccc54122103e',
  })
end
