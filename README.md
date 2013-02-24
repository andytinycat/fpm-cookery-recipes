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

*   munin-node
    This is a recent build of the Munin node for Ubuntu.
