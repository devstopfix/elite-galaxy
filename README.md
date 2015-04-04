Elite Planet Name Generator
===========================

A [Ruby](https://www.ruby-lang.org/en/) library that generates [planet](http://en.wikipedia.org/wiki/Planet) names from the orginal [Elite video game][1].

Samples:
* Lave
* Isinor
* Zaonce

## Credits

The algorithm for the planet name generation is © 1984 [Ian Bell](http://www.iancgbell.clara.net/)  and [David Braben](https://twitter.com/DavidBraben). This Ruby source is a conversion of the [Elite C sources](http://www.iancgbell.clara.net/elite/text/index.htm).

## Build & Install

    gem build elite-galaxy.gemspec 
    gem install ./elite-galaxy-1.0.0.gem 


## Usage

```ruby
require 'elite/galaxy'

planets = Elite::Galaxy.new.planets.take(256)

planets[7]
# "Lave"
```

## Bugs

Some seeds (e.g. [0x00d2 0x669d 0x0d37]) will create a galaxy containing a planet with no letters in the name.

## License

The algorithm is Copyright 1984/1999 of Ian Bell and David Braben. This Ruby library is distributed under the MIT License.

 [1]: http://en.wikipedia.org/wiki/Elite_(video_game)