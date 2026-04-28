require_relative '../piece'
# Knight class
class Knight < Piece
  DIRECTIONS = [
    [-2, -1], [-2, 1], [-1, 2], [1, 2], [2, 1], [2, -1], [1, -2], [-1, -2]
  ].freeze

  def valid_move?(board, to, pos = @position)
    possible_moves = DIRECTIONS.map { |dr, dc| [pos[0] + dr, pos[1] + dc] }
    if possible_moves.include?(to)
      new_space = board.piece_at(to)
      return true if new_space.nil? || @color != new_space.color

    end
    false
  end
end
