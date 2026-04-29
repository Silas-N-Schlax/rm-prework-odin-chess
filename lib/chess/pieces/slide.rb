# Slide movement module for Rook, Biship, and Queen
module Slide
  def slide_valid?(board, to, pos, allow_diagonal, allow_vertical_horizontal)
    dir_x = to[1] - pos[1]
    dir_y = to[0] - pos[0]

    is_diagonal = dir_x.abs == dir_y.abs
    is_vertical_horizontal = dir_x.zero? || dir_y.zero?

    return false unless (allow_diagonal && is_diagonal) || (allow_vertical_horizontal && is_vertical_horizontal)

    step_x = dir_x.zero? ? 0 : dir_x / dir_x.abs
    step_y = dir_y.zero? ? 0 : dir_y / dir_y.abs

    y, x = pos
    loop do
      x += step_x
      y += step_y
      break if to == [y, x]

      return false unless board.piece_at([y, x]).nil?
    end
    target = board.piece_at(to)
    target.nil? || target.color != @color
  end
end
