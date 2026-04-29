require_relative 'piece'
require_relative 'board/checkmate'
require_relative 'board/send_board'
Dir[File.join(__dir__, './pieces/*.rb')].sort.each { |file| require_relative file }
# Board class
class Board
  attr_accessor :board

  include Checkmate
  include SendBoard

  def initialize
    middle_board = Array.new(4) { Array.new(8, nil) }
    @board = [
      create_init_row('b', 0),
      create_pawn_row('b', 1),
      *middle_board,
      create_pawn_row('w', 6),
      create_init_row('w', 7)
    ]
    @kings = [@board[0][4], @board[7][4]]
  end

  def move_piece?(from, to, color)
    return false unless in_bounds?(from) && in_bounds?(to)

    piece = piece_at(from)
    return false if piece.color != color

    if piece.valid_move?(self, to)
      new_space = piece_at(to)

      return false if piece.color.nil? || piece.color != color
      return false if check?(color)
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

  def check?(color)
    king = find_king(color)
    pieces_of(color == 'b' ? 'w' : 'b').each do |item|
      return true if item.valid_move?(self, king.position)
    end
    false
  end

  private

  def find_king(color)
    @board.flatten.compact.find do |piece|
      piece.is_a?(King) && piece.color == color
    end
  end

  def pieces_of(color)
    @board.flatten.compact.select { |item| item.color == color }
  end

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
