require_relative '../piece'
# Pawn class
class Knight < Piece
  DIRECTIONS = [
    [-2, -1], [-2, 1], [-1, 2], [1, 2], [2, 1], [2, -1], [1, -2], [-1, -2]
  ].freeze

  def valid_move?(from, to)
    possible_moves = []
    DIRECTIONS.map do |dir|
      possible_moves.push([from[0] + dir[0], from[1] + dir[1]])
    end
    return true if possible_moves.include?(to)

    false
  end
end
