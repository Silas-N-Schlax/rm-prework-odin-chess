require_relative '../piece'
# Rook class
class Rook < Piece
  def board_piece(color)
    color == 'b' ? '♜' : '♖'
  end

  def valid_move?(board, to, pos = @position)
    slide_valid?(board, to, pos, false, true)
  end
end
