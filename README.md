repo-make
=========

Introduction
------------

repo-make is a small tool which allows you to autobuild a set of PKGBUILD's into a working repository.

repo-make has been created with version control in mind. The developer adds a "repo-make.conf" file to his repository which describes how to build his PKGBUILD's. If the developer changes something in the repository, then users may just fetch the latest changes and run "repo-make" to create/update a local repository.

Using with continuous integration
---------------------------------

This repository contains a "repo-make-ci.sh" file which can be used with CI systems to auto-create a Arch Linux chroot and call repo-make inside it.

For an example where this is set up, have a look at [VDR4Arch's .travis.yml file](https://github.com/VDR4Arch/vdr4arch/blob/master/.travis.yml)

For security reasons you may add a copy of this script to your own repository. If you don't want to mix up licenses in your repository, then feel free to auto-download the script from the [Releases page](https://github.com/M-Reimer/repo-make/releases) in your "before_script" routine in .travis.yml to set it up temporarily for each build.

Users of repo-make
------------------

Currently the following PKGBUILD repositories can be built with repo-make:

[vdr4arch](https://github.com/VDR4Arch/vdr4arch)
[wine-lol](https://github.com/M-Reimer/wine-lol)

Please contact me to get your repository added here.
