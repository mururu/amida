%w{
  version
  label
  route
  prize
}.each{|lib|require File.expand_path("../amida/#{lib}", __FILE__)}

module Amida
  class Amida
    def initialize(args={})
      @width = args[:width] || 5
      @height = args[:height] || 10
      raise ArgumentError, 'Width of Amida has to be 2 and over' if @width < 2
      raise ArgumentError, 'Height of Amida has to be 1 nad over' if @height < 1

      @label = Label.new(@width)
      @route = Route.new(@width, @height)
      @prize = Prize.new(@width)
    end

    def render
      @label.render
      @route.render
      @prize.render
    end
  end
end
