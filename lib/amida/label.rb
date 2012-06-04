module Amida
  class Label
    def initialize(width)
      raise ArgumentError, "Width of Amida has to be 27 and under" if width > 26
      @content = ('A'..'Z').to_a[0..width-1]
    end

    def render
      puts to_s
    end

    private
    def to_s
      ' ' + (@content.join('   ')) + ' '
    end
  end
end
