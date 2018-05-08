# Installation profile

Basic installation profile, all it does is:

1. Enable the bare minimum amount of core modules.
2. Setup `seven` as administrative theme and [`oe_theme`][1] as front-end theme.

## Rationale

Opting for a minimalistic installation profile will make it easier to deal with a fully distributed approach: the
installation profile is seen as an empty shell that will never pose any compatibility issue to any of the site's modules
and themes. Most importantly this will allow modules and themes maintainers to properly version their work semantically.

This profile will also be used to build a basic site using the multiple comonents of OpenEuropa, including oe_multilingual, oe_paragraphs and oe_webtools.


**Table of contents:**

- [Installation](#installation)
- [Development](#development)
  - [Project setup](#project-setup)
  - [Using Docker Compose](#using-docker-compose)
  - [Disable Drupal 8 caching](#disable-drupal-8-caching)
  - [Working with ECL components](#working-with-ecl-components)
- [Demo module](#demo-module)

## Installation

The recommended way of installing the OpenEuropa profile is via a [Composer-based workflow][2].

In the root of the project, run

```
$ composer install
```

Build the theme
In order to build the oe_theme in your project perform the following steps:
```
cd build/themes/custom/oe_theme
npm install && npm run build
cd ../../../../
```

Before setting up and installing the site make sure to customize default configuration values by copying runner.yml.dist to ./runner.yml and override relevant properties.
To set up the project run:

```
$ ./vendor/bin/run drupal:site-setup
```

This will:

Symlink the theme in ./build/themes/custom/oe_theme so that it's available to the target site

Setup Drush and Drupal's settings using values from ./runner.yml.dist

Setup PHPUnit and Behat configuration files using values from ./runner.yml.dist

After a successful setup install the site by running:

```
$ ./vendor/bin/run drupal:site-install
```

This will:

Install the target site

Set the OpenEuropa Theme as the default theme

Enable OpenEuropa Theme Demo and Configuration development modules


### Using Docker Compose

The setup procedure described above can be sensitively simplified by using Docker Compose.

Requirements:

- [Docker][3]
- [Docker-compose][4]

Run:

```
$ docker-compose up -d
```

Then:

```
$ docker-compose exec -u web web composer install
$ docker-compose exec -u node node npm install
$ docker-compose exec -u node node npm run build
$ docker-compose exec -u web web ./vendor/bin/run drupal:site-setup
$ docker-compose exec -u web web ./vendor/bin/run drupal:site-install
```

Your test site will be available at [http://localhost:8080/build](http://localhost:8080/build).

Run tests as follows:

```
$ docker-compose exec -u web web ./vendor/bin/phpunit
$ docker-compose exec -u web web ./vendor/bin/behat
```

[1]: https://github.com/openeuropa/oe_theme/releases
[2]: https://www.drupal.org/docs/develop/using-composer/using-composer-to-manage-drupal-site-dependencies#managing-contributed
[3]: https://www.docker.com/get-docker
[4]: https://docs.docker.com/compose