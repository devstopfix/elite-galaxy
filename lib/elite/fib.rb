#
# The Fibonacci series in the Elite algorithm is a triple
# of unsigned 16-bit integers.
#
module Elite
  module Fib
    # Keep integer i within unsigned 16-bits
    def int_16_bits(i)
      i & MASK_16
    end

    # Generate next triple in series
    def next_fib_triple(triple)
      w0, w1, w2 = triple
      [w1, w2, int_16_bits(w0 + w1 + w2)]
    end

    MASK_16 = (1 << 16)-1
  end
end