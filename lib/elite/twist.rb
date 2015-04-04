# Bit-shift functions
module Elite
  module Twist
    # Rotate-left circular of lowest 8 bits. 
    # (see http://www.z80.info/gfx/zrlc.gif)
    def rlc8(x)
      ((x & 0x7F) << 1) + ((x & 0x80) >> 7)
    end

    # Apply rlc8() to high and low bytes of x independently
    def twist(x)
      hi_x = x >> 8
      lo_x = (x & 0xFF)
      (rlc8(hi_x) << 8) + (rlc8 lo_x)
    end
  end
end