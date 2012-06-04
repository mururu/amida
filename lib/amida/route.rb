module Amida
  class Route
    def initialize(width, height)
      @width, @height = width, height
      @crossbars = generate_crossbars
    end

    def render
      puts to_s
    end

    private
    def to_s
      @crossbars.map{|line| ' |' + (line.map{|x| x ? '---' : '   '}.join('|')) + '| '}.join("\n")
    end

    def generate_crossbars
      crossbars = Array.new(@height).map{ Array.new(@width-1) }
      crossbars.map! do |line|
        before_flg = false
        line.map do |x|
          unless before_flg
            before_flg = [true,false].sample
          else
            before_flg = false
          end
        end
      end
      unless crossbars.any?{|line| line.any?{|x| x}}
        crossbars[(0..@height-1).to_a.sample][(0..@width-2).to_a.sample] = true
      end
      crossbars
    end
  end
end
