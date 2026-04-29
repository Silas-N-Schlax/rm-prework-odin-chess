require_relative '../piece'
# Pawn class
class Queen < Piece
  def valid_move?(board, to, pos = @position)
    slide_valid?(board, to, pos, true, true)
  end
end
