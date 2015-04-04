require 'elite/twist'
require 'elite/fib'

module Elite

  class Galaxy
    include Elite::Twist
    include Elite::Fib
    attr_reader :seed

    def self.random_galaxy
      Galaxy.new([rand(32768), rand(32768), rand(32768)])
    end

    def initialize(seed=GALAXY_1)
      unless seed.is_a?(Array) && seed.size==3
        throw Exception.new("Galactic seed must be array of three 16-bit words")
      end
      @seed = seed
    end

    def next_galaxy()
      Galaxy.new(twist_seed)
    end

    # Return an enumeration of planet names in the galaxy. The generator
    # stops if the planet sequence returns to it's initial state.
    def planets()
      pseed = @seed.clone
      Enumerator.new do |yielder|
        loop do
          name, new_seed = planet_name(pseed)
          yielder.yield name
          break if new_seed==@seed
          pseed = new_seed
        end
      end
    end

    # Calculate the planet name from the given seed, and return
    # a pair of the name and the next seed to be used.
    def planet_name(planet_seed)
      s = planet_seed.clone
      pairs = 4.times.collect do
        pair = letter_pair(s)
        s = next_fib_triple(s)
        pair
      end 
      pairs = pairs.take(3) unless long_name?(planet_seed)
      return pairs.join.capitalize, s      
    end

    # 6th bit of first word determines if we have a long 4-pair name,
    # otherwise we just have a 3-pair name.
    def long_name?(seed)
      ((seed.first) & 0x40) != 0
    end

    # The index of the letter pair is determined by the lower 5 bits
    # of high byte of the last word of the seed.
    def letter_pair(seed)
      idx = 2 * ((seed.last >> 8) & 0x1F)
      PAIRS[idx,2].gsub('.','')
    end

    # New galaxy created by modifying seed of this galaxy
    def twist_seed
      @seed.map {|x| twist(x)}
    end

    GALAXY_1 = [0x5A4A, 0x0248, 0xB753]
    PAIRS="..LEXEGEZACEBISOUSESARMAINDIREA.ERATENBERALAVETIEDORQUANTEISRION"
  end

end
