require 'package'

class Cloog < Package
  description 'Chunky Loop Generator which is used to perform optimization in gcc'
  homepage 'https://www.cloog.org/'
  version "0.18.4-cc1.5"
  binary_url ({
    aarch64: 'https://github.com/jam7/chrome-cross/releases/download/v1.5/cloog-0.18.4-cc1.5-chromeos-armv7l.tar.xz',
    armv7l:  'https://github.com/jam7/chrome-cross/releases/download/v1.5/cloog-0.18.4-cc1.5-chromeos-armv7l.tar.xz',
    i686:    'https://github.com/jam7/chrome-cross/releases/download/v1.5/cloog-0.18.4-cc1.5-chromeos-i686.tar.xz',
    x86_64:  'https://github.com/jam7/chrome-cross/releases/download/v1.5/cloog-0.18.4-cc1.5-chromeos-x86_64.tar.xz',
  })
  binary_sha1 ({
    aarch64: '5f33ce155bc3b8332482ec27c1b02df8fb76b050',
    armv7l:  '5f33ce155bc3b8332482ec27c1b02df8fb76b050',
    i686:    '013df342e55f5e374f558adf2315503cd0ae6a4b',
    x86_64:  'd14a62ee8c035eb793d4232c3787f78c890ef8c6',
  })
end
