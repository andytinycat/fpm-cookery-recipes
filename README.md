fpm-cookery-recipes
===================

Recipes for package building with [fpm-cookery](https://github.com/bernd/fpm-cookery).

Instructions
------------

To prepare for use:

    bundle install

To build a package. do:

    bundle exec fpm-cook package-name/recipe.rb package

To clean up after a build, do:

    bundle exec fpm-cook package-name/recipe.rb clean

List of packages
----------------

### munin-node ###
A recent version of the Munin 2 node for Ubuntu (the shipped one is 1.4.x).

Notes
-----

This uses my fork of fpm-cookery, until pull request [#17](https://github.com/bernd/fpm-cookery/pull/17) is merged.
