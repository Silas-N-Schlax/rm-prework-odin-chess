require_relative '../piece'
# Pawn class
class King < Piece
  def board_piece
    @color == 'b' ? '♚' : '♔'
  end

  def valid_move?(board, to, pos = @position)
    dir_x = to[1] - pos[1]
    dir_y = to[0] - pos[0]
    return false unless [dir_x.abs, dir_y.abs].max == 1

    target = board.piece_at(to)
    target.nil? || target.color != @color
  end
end
