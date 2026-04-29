require_relative '../piece'
# Pawn class
class Pawn < Piece
  def board_piece(color)
    color == 'b' ? '♟' : '♙'
  end

  def valid_move?(board, to, pos = @position)
    dir_x = to[1] - pos[1]
    dir_y = to[0] - pos[0]
    y_step = @color == 'b' ? 1 : -1
    return false if dir_y > 2 || dir_y < -2
    return capture?(board, to, y_step, pos) unless dir_x.zero?

    return false if (dir_y.negative? && !y_step.negative?) || (!dir_y.negative? && y_step.negative?)

    y, x = pos
    if dir_y == y_step
      return true if board.piece_at([y + y_step, x]).nil?
    elsif starting_position?
      return true if board.piece_at([y + y_step, x]).nil? && board.piece_at([(y + (y_step * 2)), x]).nil?
    end
    false
  end

  def starting_position?
    return true if @position[0] == 1 && @color == 'b'
    return true if @position[0] == 6 && @color == 'w'

    false
  end

  def capture?(board, to, y_step, pos = @position)
    dir_x = to[1] - pos[1]
    dir_y = to[0] - pos[0]
    return false unless dir_x.abs == 1 && dir_y == y_step

    y, x = pos
    x += dir_x <=> 0
    y += dir_y <=> 0
    return false unless board.piece_at([y, x])

    target = board.piece_at(to)
    return true if target.nil? || target.color != @color

    false
  end
end
