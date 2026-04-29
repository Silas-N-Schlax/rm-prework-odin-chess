require_relative '../piece'
# Rook class
class Rook < Piece
  DIRECTIONS = [
    [0, 1], [1, 0], [0, -1], [-1, 0]
  ].freeze

  def valid_move?(board, to, pos = @position)
    vertical_horizontal_movement(board, to, pos)
  end
end
