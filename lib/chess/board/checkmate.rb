# Checkmate module
module Checkmate
  def checkmate?(color)
    return false unless check?(color)

    all_moves(color).none? do |from, to|
      valid_move?(from, to)
    end
  end

  def all_moves(color)
    moves = []
    pieces_of(color).each do |piece|
      (0..7).each do |y|
        (0..7).each do |x|
          moves << [piece.position, [y, x]]
        end
      end
    end
    moves
  end

  def valid_move?(from, to)
    piece = piece_at(from)
    return false if piece.nil? || from == to

    return false unless piece.valid_move?(self, to)

    color = piece.color
    captured = piece_at(to)
    move_piece(from, to)
    in_check = check?(color)
    move_piece(to, from)
    reset_piece(captured)

    !in_check
  end

  private

  def move_piece(from, to)
    piece = piece_at(from)
    piece.position = to
    @board[to[0]][to[1]] = piece
    @board[from[0]][from[1]] = nil
  end

  def reset_piece(piece)
    return if piece.nil?

    at = piece.position
    @board[at[0]][at[1]] = piece
  end
end
