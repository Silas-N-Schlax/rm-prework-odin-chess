require_relative '../piece'
# Bishop class
class Bishop < Piece
  def board_piece(color)
    color == 'b' ? '♝' : '♗'
  end

  def valid_move?(board, to, pos = @position)
    slide_valid?(board, to, pos, true, false)
  end
end
