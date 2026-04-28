require_relative 'spec_helper'
require_relative '../lib/chess/board'
require_relative '../lib/chess/piece'
require_relative '../lib/chess/pieces/pawn'

RSpec.describe Board do
  describe '#initialize' do
    let(:board) { described_class.new }
    context 'when board is initalized' do
      it 'creates a 8x8 grid' do
        expect(board.board.length).to be(8)
        board.board.each do |row|
          expect(row.length).to be(8)
        end
      end
      it 'fills row 6 with white pawns' do
        expect(board.board[6].all? { |piece| piece.is_a?(Pawn) && piece.color == 'w' })
      end
      it 'fills row 1 with black pawns' do
        expect(board.board[1].all? { |piece| piece.is_a?(Pawn) && piece.color == 'b' })
      end
      it 'fills row 7 with white peices' do
        expect(board.board[7].none?(&:nil?)).to be true
      end
      it 'fills row 0 with black peices' do
        expect(board.board[0].none?(&:nil?)).to be true
      end
      it 'sets rows 2-5 to nil' do
        expect(board.board[2..5].none?(&:nil?)).to be true
      end
    end
  end

  describe '#in_bounds?' do
    let(:board_in_bounds) { described_class.new }
    context 'returns true' do
      it 'when position is [0, 0]' do
        expect(board_in_bounds.in_bounds?([0, 0])).to be true
      end
      it 'when position is [7, 7]' do
        expect(board_in_bounds.in_bounds?([7, 7])).to be true
      end
      it 'when position is [5, 6]' do
        expect(board_in_bounds.in_bounds?([5, 6])).to be true
      end
    end
    context 'returns false' do
      it 'when position is [-1, 0]' do
        expect(board_in_bounds.in_bounds?([-1, 0])).to be false
      end
      it 'when position is [8, 8]' do
        expect(board_in_bounds.in_bounds?([8, 8])).to be false
      end
    end
  end

  describe '#piece_at' do
    let(:piece) { described_class.new }
    context 'returns peice' do
      it 'when position is [0, 0]' do
        expect(piece.piece_at([0, 1])).to be_a(Knight)
      end
      it 'when position is [0, 5]' do
        expect(piece.piece_at([0, 5])).to be_a(Bishop)
      end
    end
    context 'rerns nil' do
      it 'when positon is [3, 5]' do
        expect(piece.piece_at([3, 5])).to be nil
      end
      it 'when position is [4, 5]' do
        expect(piece.piece_at([4, 5])).to be nil
      end
    end
  end

  describe '#move_piece?' do
    let(:move) { described_class.new }
    context 'returns true when piece is knight, starting at [0, 1]' do
      it 'moving to [2, 0]' do
        expect(move.move_piece?([0, 1], [2, 0], 'b')).to be true
      end
      it 'moving to [2, 2]' do
        expect(move.move_piece?([0, 1], [2, 2], 'b')).to be true
      end
    end
    context 'returns false when piece is knight, starting at [0, 1]' do
      it 'moving to [-2, 0]' do
        expect(move.move_piece?([0, 1], [-2, 0], 'b')).to be false
      end
      it 'moving to [0, 0]' do
        expect(move.move_piece?([0, 1], [0, 0], 'b')).to be false
      end
    end
  end

  describe '#update_board' do
    let(:board) { described_class.new }
    context 'updated the board' do
      before do
        board.update_board([0, 1], [2, 0], 'b')
      end
      it 'when move is valid' do
        expect(board.board[0][1]).to be nil
        expect(board.board[2][0]).to be_a(Knight)
      end
    end
    context 'update the board' do
      before do
        board.update_board([0, 1], [2, 2], 'b')
        board.update_board([2, 2], [4, 3], 'b')
        board.update_board([4, 3], [6, 4], 'b')
      end
      it 'when move is valid and capture' do
        expect(board.board[0][1]).to be nil
        expect(board.board[2][2]).to be nil
        expect(board.board[4][3]).to be nil
        expect(board.board[6][4]).to be_a(Knight)
      end
    end
    context 'does not update the board' do
      before do
        board.update_board([0, 1], [1, 0], 'b')
      end
      it 'when move is invalid' do
        expect(board.board[0][1]).to be_a(Knight)
        expect(board.board[1][0]).to be_a(Pawn)
      end
    end
    context 'does not update the board' do
      before do
        board.update_board([0, 1], [2, 2], 'b')
        board.update_board([2, 2], [1, 4], 'b')
      end
      it 'when move is capturing players own piece' do
        expect(board.board[0][1]).to be nil
        expect(board.board[2][2]).to be_a(Knight)
        expect(board.board[1][4]).to be_a(Pawn)
      end
    end
  end
end
