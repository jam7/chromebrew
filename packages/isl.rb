require 'package'

class Isl < Package
  description 'Integer Set Library for manipulating sets and relations of integer points bounded by linear constraints'
  homepage 'http://isl.gforge.inria.fr/'
  version "0.18-cc1.5"
  binary_url ({
    aarch64: 'https://github.com/jam7/chrome-cross/releases/download/v1.5/isl-0.18-cc1.5-chromeos-armv7l.tar.xz',
    armv7l:  'https://github.com/jam7/chrome-cross/releases/download/v1.5/isl-0.18-cc1.5-chromeos-armv7l.tar.xz',
    i686:    'https://github.com/jam7/chrome-cross/releases/download/v1.5/isl-0.18-cc1.5-chromeos-i686.tar.xz',
    x86_64:  'https://github.com/jam7/chrome-cross/releases/download/v1.5/isl-0.18-cc1.5-chromeos-x86_64.tar.xz',
  })
  binary_sha1 ({
    aarch64: 'c8576e52f571bd212dd88030466bba43c408c762',
    armv7l:  'c8576e52f571bd212dd88030466bba43c408c762',
    i686:    '07526be2f81d86035286960df78b010e64a91494',
    x86_64:  '61f69453e2a73bff8da20df7e64d4a8068c6576c',
  })
end
