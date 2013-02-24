fpm-cookery-recipes
===================

Recipes for package building with [fpm-cookery](https://github.com/bernd/fpm-cookery).

Instructions
------------

To prepare the tool for use:

    bundle install

To build a package. do:

    bundle exec fpm-cook munin-node/recipe.rb package

To clean up after a build, do:

    bundle exec fpm-cook munin-node/recipe.rb clean
