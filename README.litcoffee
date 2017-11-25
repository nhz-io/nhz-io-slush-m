# Module generator (@nhz.io scoped)

[![Travis Build][travis]](https://travis-ci.org/nhz-io/nhz-io-slush-m)
[![NPM Version][npm]](https://www.npmjs.com/package/@nhz.io/slush-m)


## Install

```bash
npm i -g slush @nhz.io/slush-m
```

## Usage
```bash
mkdir mod && cd mod

slush @nhz.io/m
```

## Literate Source

### Imports

> Builtins

    path     = require 'path'

> General

    gulp     = require 'gulp'
    pump     = require 'pump'
    inquirer = require 'inquirer'

> Gulp plugins

    install  = require 'gulp-install'
    conflict = require 'gulp-conflict'
    template = require 'gulp-template'
    rename   = require 'gulp-rename'

> String utils imports

    slugify   = require 'slugify'
    camelcase = require 'camelcase'

## Default task

    gulp.task 'default', ->

      answers = await inquirer.prompt [
        {
          name: 'pkgName'
          message: 'Package name?'

> Strip scope prefix from default package name

          default: (path.basename process.cwd()).replace /^(nhz-io-)?/, ''
        }
        {
          name: 'pkgDescription'
          message: 'Description?'
        }
        {
          name: 'pkgVersion'
          message: 'Version?'
          default: '0.0.0'
        }
        {
          type: 'confirm'
          name: 'continue'
          message: 'Continue?'
        }
      ]

      return done() unless answers.continue

> Strip scope prefix from package name

      answers.pkgName = answers.pkgName.replace(/^nhz-io-/, '')

> Slugify

      answers.pkgNameSlug = slugify answers.pkgName, '-'

> Camel Case

      answers.pkgNameCamelCase = camelcase answers.pkgName

> Generate package

      pump [
        gulp.src __dirname + '/templates/**/*'

        template answers

        rename (f) -> if f.basename[0] is '_' then f.basename = ".#{ f.basename.slice 1 }"

        conflict './'

        gulp.dest './'

        install()
      ]


## Version 1.0.4
## License [MIT](LICENSE)

[travis]: https://img.shields.io/travis/nhz-io/nhz-io-slush-m.svg?style=flat
[npm]: https://img.shields.io/npm/v/@nhz.io/slush-m.svg?style=flat
