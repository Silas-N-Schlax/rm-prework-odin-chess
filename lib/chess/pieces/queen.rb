require_relative '../piece'
# Pawn class
class Queen < Piece
  def board_piece
    @color == 'b' ? '♛' : '♕'
  end

  def valid_move?(board, to, pos = @position)
    slide_valid?(board, to, pos, true, true)
  end
end
