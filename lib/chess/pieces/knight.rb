require_relative '../piece'
# Pawn class
class Knight < Piece
  DIRECTIONS = [
    [-2, -1], [-2, 1], [-1, 2], [1, 2], [2, 1], [2, -1], [1, -2], [-1, -2]
  ].freeze

  def valid_move?(to, pos = @position)
    possible_moves = []
    DIRECTIONS.map do |dir|
      possible_moves.push([pos[0] + dir[0], pos[1] + dir[1]])
    end
    return true if possible_moves.include?(to)

    false
  end
end
