require_relative '../piece'
# Bishop class
class Bishop < Piece
  DIRECTIONS = [
    [1, 1], [1, -1], [-1, -1], [-1, 1]
  ].freeze

  def valid_move?(board, to, pos = @position)
    diagonal_movement(board, to, pos)
  end
end
