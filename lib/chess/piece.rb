require_relative 'pieces/slide'
# Piece class
class Piece
  attr_reader :color, :bp
  attr_accessor :position

  include Slide

  def initialize(color, position, bp = board_piece(color))
    @color = color
    @position = position
    @bp = bp # Board piece
  end
end
