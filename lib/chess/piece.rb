require_relative 'pieces/slide'
# Piece class
class Piece
  attr_reader :color
  attr_accessor :position

  include Slide

  def initialize(color, position)
    @color = color
    @position = position
  end
end
