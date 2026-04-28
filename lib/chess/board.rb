require_relative 'piece'
Dir[File.join(__dir__, './pieces/*.rb')].sort.each { |file| require_relative file }
# Board class
class Board
  attr_accessor :board

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

  def move_piece?(from, to, color)
    return false unless in_bounds?(from) && in_bounds?(to)
    piece = piece_at(from)
    if piece.valid_move?(to)
      new_space = piece_at(to)

      return false if piece.color.nil? || piece.color != color
      return true if new_space.nil? || piece.color != new_space.color
    end
    false
  end

  def update_board(from, to, color)
    return false unless move_piece?(from, to, color)

    piece = piece_at(from)
    piece.position = to
    @board[to[0]][to[1]] = piece
    @board[from[0]][from[1]] = nil
  end

  def piece_at(pos)
    row, col = pos
    @board[row][col]
  end

  def in_bounds?(pos)
    pos[0].between?(0, 7) && pos[1].between?(0, 7)
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

# board = Board.new
# p board.board[0][1]
# p board.board[2][0]
# p board.update_board([0, 1], [2, 0], 'b')
# p board.move_piece?([2, 0], [4, 3], 'b')
# # board.update_board([4, 3], [6, 4], 'b')
# # p board.board[0][1]
# # p board.board[2][0]
# # p board.board[4][3]
