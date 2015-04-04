require 'elite/twist'

module Elite

  class Galaxy
    include Elite::Twist
    attr_reader :seed

    def initialize(seed=GALAXY_1)
      unless seed.is_a?(Array) && seed.size==3
        throw Exception.new("Galactic seed must be array of three 16-bit words")
      end
      @seed = seed
    end

    def next_galaxy()
      Galaxy.new(twist_seed)
    end

    def planets()
      []
    end

    # New galaxy created by modifying seed of this galaxy
    def twist_seed
      @seed.map {|x| twist(x)}
    end

    GALAXY_1 = [0x5A4A, 0x0248, 0xB753]
  end
  
end
