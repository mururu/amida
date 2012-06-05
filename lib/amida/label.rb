module Amida
  class Label
    def initialize(width)
      raise ArgumentError, "Width of Amida has to be 26 and under" if width > 26
      @content = ('A'..'Z').to_a[0..width-1]
    end

    def render
      puts to_s
    end

    private
    def to_s
      content = @content.map.with_index{|s,i| "\e[#{i%5 < 2 ? i%5 + 31 : i%5 + 32}m" + s + "\e[0m"}
      ' ' + (content.join('   ')) + ' '
    end
  end
end
