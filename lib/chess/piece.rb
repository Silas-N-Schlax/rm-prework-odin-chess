# Piece class
class Piece
  attr_reader :color
  attr_accessor :position

  def initialize(color, position)
    @color = color
    @position = position
  end

  def diagonal_movement(board, to, pos = @position)
    dir_x = to[1] - pos[1]
    dir_y = to[0] - pos[0]
    return false unless dir_x.abs == dir_y.abs

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

  def vertical_horizontal_movement(board, to, pos = @position)
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
