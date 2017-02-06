chromebrew
==========

Package manager for Chrome OS

Supported Systems
-----------------

| Architecture | Supported? |
|:---:|:---:|
| x86_64 | Yes |
| i686 | Yes |
| armv7l | Yes |
| aarch64 | Yes |

Here, I'm releasing personally modified chromebrew.  Modifications are listed at
[below](#modifications). If you are looking for the original chromebrew, please
refer [the original site](https://github.com/skycocker/chromebrew/).

Basically, I want to merge all modifications here to the original one.
So, this chromebrew often rebase to the original one to make merging
easier.

Overview
--------

Chromebooks with Chrome OS run a Linux kernel. The only missing pieces to use them as full-featured Linux distro were gcc and make with their dependencies. Well, these pieces aren't missing anymore. Say hello to chromebrew!

Prerequisites
-------------

You will need a Chromebook with developer mode enabled.

On [the ChromiumOS Wiki](https://www.chromium.org/chromium-os/developer-information-for-chrome-os-devices) select your device and follow the instructions listed there.

Please be aware of the fact that developer mode is insecure if not properly configured.

Installation
------------
Open the terminal with Ctrl+Alt+T and type `shell`.

If this command returns `ERROR: unknown command: shell` please have a second look at the prerequisites and make sure your Chromebook is in developer mode.

Then download and run the installation script below:

    wget -q https://raw.github.com/skycocker/chromebrew/master/install.sh && yes | bash install.sh

    -- or --

    curl -Ls git.io/vddgY -o install.sh && yes | bash install.sh

On a rooted Google OnHub, the command needs to be run with the "chronos" user. In order to make su work, a password is needed for the chronos user.

    # passwd chronos
    Changing password for chronos.
    Enter new UNIX password:
    Retype new UNIX password:
    # su - chronos
    Password:
    $ curl -Ls git.io/vddgY -o install.sh && yes | bash install.sh

Usage
-----

    crew <command> [-k|--keep] <package1> [<package2> ...]

Where available commands are:

  * build [build package(s) from source and store the archive and checksum in the current working directory]
  * download [download package(s) to `CREW_BREW_DIR` (`/usr/local/tmp/crew` by default), but don't install]
  * files [display installed files of package(s).]
  * help [get information about command usage]
  * install [install package(s) along with dependencies after prompting for confirmation]
  * remove [remove package(s)]
  * search [look for a package]
  * update [update crew itself]
  * upgrade [update all or specific package(s)]
  * whatprovides [regex search for package(s) that contains file(s)]

Available packages are listed in the [packages directory](https://github.com/jam7/chromebrew/tree/master/packages).

Chromebrew will wipe its `BREW_DIR` (`/usr/local/tmp/crew` by default) after installation unless you pass `-k` or `--keep` when running `crew install`.

    crew install --keep <package1> [<package2> ...]

Modifications
-------------

Chromebrew at this repository is modified from its original, https://github.com/skycocker/chromebrew.
I'll merge these modifications to the original, but it's time consuming.

What modifications are:

  * Refactoring crew
    * Change to clean working directory before source extraction
    * Add binstall (build and install)

License
-------

Copyright 2013-2017 Michal Siwek and [all the awesome contributors](https://github.com/skycocker/chromebrew/graphs/contributors).
Copyright 2016-2017 Kazushi (Jam) Marukawa, ARM related stuff and local modifications.

This project including all of its source files is released under the terms of [GNU General Public License (version 3 or later)](http://www.gnu.org/licenses/gpl.txt).

Thanks Davy for [putting pre-compiled gcc for ARM](http://davy.nyacom.net/cros-arm-dev.html).  It was the beginning of chromebrew for ARM.
