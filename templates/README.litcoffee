# <%= pkgDescription %>

[![Travis Build][travis]](https://travis-ci.org/nhz-io/nhz-io-<%= pkgNameSlug %>)
[![NPM Version][npm]](https://www.npmjs.com/package/@nhz.io/<%= pkgNameSlug %>)

## Install

```bash
npm i -S @nhz.io/<%= pkgNameSlug %>
```

## Usage
```js
const <%= pkgNameCamelCase %> = require('@nhz.io/<%= pkgNameSlug %>')

...
```

## Literate Source

    <%= pkgNameCamelCase %> = -> throw Error 'UNIMPLEMENTED'

### Exports

    module.exports = <%= pkgNameCamelCase %>

## Tests

    test = require 'tape-async'

    test '<%= pkgNameCamelCase %>()', (t) ->

      await new Promise (resolve) -> setTimeout resolve, 100

      t.ok <%= pkgNameCamelCase %>()

## Version <%= pkgVersion %>

## License [MIT](LICENSE)

[travis]: https://img.shields.io/travis/nhz-io/nhz-io-<%= pkgNameSlug %>.svg?style=flat
[npm]: https://img.shields.io/npm/v/@nhz.io/<%= pkgNameSlug %>.svg?style=flat
