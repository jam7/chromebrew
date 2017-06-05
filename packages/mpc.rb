require 'package'

class Mpc < Package
  description 'Gnu Mpc is a C library for the arithmetic of complex numbers with arbitrarily high precision and correct rounding of the result.'
  homepage 'http://www.multiprecision.org/'
  version '1.0.3-cc1.5'
  binary_url ({
    aarch64: 'https://github.com/jam7/chrome-cross/releases/download/v1.5/mpc-1.0.3-cc1.5-chromeos-armv7l.tar.xz',
    armv7l:  'https://github.com/jam7/chrome-cross/releases/download/v1.5/mpc-1.0.3-cc1.5-chromeos-armv7l.tar.xz',
    i686:    'https://github.com/jam7/chrome-cross/releases/download/v1.5/mpc-1.0.3-cc1.5-chromeos-i686.tar.xz',
    x86_64:  'https://github.com/jam7/chrome-cross/releases/download/v1.5/mpc-1.0.3-cc1.5-chromeos-x86_64.tar.xz',
  })
  binary_sha1 ({
    aarch64: 'e3067ad4048cdbbd5bdcaab2796725a68780a560',
    armv7l:  'e3067ad4048cdbbd5bdcaab2796725a68780a560',
    i686:    'af008e6e06e69767bacf96355e0451f322379a7e',
    x86_64:  '15a9e7f919fa3dcb81e4ff535bcc95dced119d78',
  })
end
