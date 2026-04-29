require_relative '../piece'
# Bishop class
class Bishop < Piece
  def valid_move?(board, to, pos = @position)
    slide_valid?(board, to, pos, true, false)
  end
end
