require_relative 'piece'
Dir[File.join(__dir__, './pieces/*.rb')].sort.each { |file| require_relative file }
# Board class
class Board
  attr_reader :board

  def initialize
    middle_board = Array.new(4) { Array.new(8, nil) }
    @board = [
      create_init_row('b', 0),
      create_pawn_row('b', 1),
      *middle_board,
      create_pawn_row('w', 6),
      create_init_row('w', 7)
    ]
  end

  private

  def create_init_row(col, row)
    [
      Rook.new(col, [row, 0]), Knight.new(col, [row, 1]),
      Bishop.new(col, [row, 2]), Queen.new(col, [row, 3]),
      King.new(col, [row, 4]), Bishop.new(col, [row, 5]),
      Knight.new(col, [row, 6]), Rook.new(col, [row, 7])
    ]
  end

  def create_pawn_row(col, row)
    row_ary = []
    8.times do |i|
      row_ary.push(Pawn.new(col, [row, i]))
    end
    row_ary
  end
end

Board.new
