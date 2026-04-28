require_relative '../piece'
# Rook class
class Rook < Piece
  DIRECTIONS = [
    [0, 1], [1, 0], [0, -1], [-1, 0]
  ].freeze

  def valid_move?(board, to, pos = @position)
    dir_x = to[1] - pos[1]
    dir_y = to[0] - pos[0]
    return false unless dir_x.zero? || dir_y.zero?

    y, x = pos
    loop do
      x += dir_x <=> 0
      y += dir_y <=> 0
      break if to == [y, x]

      return false unless board.piece_at([y, x]).nil?
    end
    target = board.piece_at(to)
    target.nil? || target.color != @color
  end
end
