# Cryostasis

Cryostasis allows you to preserve files into the crystal binary. Upon launch of the app, the files will be restored to their location relative to the executable. This allows you to access the files in a standard crystal way and does not keep the files in memory for longer than they need to be.

## Installation

1. Add the dependency to your `shard.yml`:

   ```yaml
   dependencies:
     cryostasis:
       github: jwaldrip/cryostasis
   ```

2. Run `shards install`

## Usage

```crystal
require "cryostasis"

Cryostasis.preserve("glob/pattern/of/files/**")
```

## Contributing

1. Fork it (<https://github.com/jwaldrip/cyrostasis/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [jwaldrip](https://github.com/jwaldrip/cyrostasis) - creator and maintainer
