require 'colorize'
# Init the players
class Player
  attr_reader :name, :color

  def initialize(name = nil, color = 'w')
    @name = name
    @color = color
  end
end
