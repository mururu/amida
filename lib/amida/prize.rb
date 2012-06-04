module Amida
  class Prize
    def initialize(width)
      ArgumentError if width.nil?
      @width = width
      content = ['   ']*width
      content[random_index] = '!!!'
      @content = content
    end

    def render
      puts to_s
    end

    private
    def random_index
      (0..@width-1).to_a.sample
    end

    def to_s
      @content.join(' ')
    end
  end
end
