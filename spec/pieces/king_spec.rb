require_relative '../spec_helper'
require_relative '../../lib/chess/pieces/king'
require_relative '../../lib/chess/board'
require_relative '../../lib/chess/pieces/pawn'

RSpec.describe King do
  context 'when peice is created' do
    let(:king) { described_class.new('w', [1, 2]) }
    it 'has a color' do
      expect(king.color).to eq('w')
    end
    it 'has a position' do
      expect(king.position).to eq([1, 2])
    end
  end
  describe '#valid_move' do
    let(:board) { Board.new }
    context 'returns true' do
      let(:king) { described_class.new('b', [1, 4]) }
      before do
        board.board = Array.new(8) { Array.new(8, nil) }
      end
      it 'when king moves forward with no interference' do
        expect(king.valid_move?(board, [2, 4])).to be true
      end
      it 'when king moves ++ diagonal with no interference' do
        expect(king.valid_move?(board, [2, 5])).to be true
      end
      it 'when king moves right with no interference' do
        expect(king.valid_move?(board, [1, 5])).to be true
      end
      it 'when king moves +- diagonal with no interference' do
        expect(king.valid_move?(board, [0, 5])).to be true
      end
      it 'when king moves backwards with no interference' do
        expect(king.valid_move?(board, [0, 4])).to be true
      end
      it 'when king moves -- diagonal with no interference' do
        expect(king.valid_move?(board, [0, 3])).to be true
      end
      it 'when king moves left with no interference' do
        expect(king.valid_move?(board, [1, 3])).to be true
      end
      it 'when the king moves +- diagonal with no interference' do
        expect(king.valid_move?(board, [2, 3])).to be true
      end
    end
    context 'returns true' do
      let(:king) { described_class.new('g', [1, 4]) }
      before do
        board.board[2][3] = Pawn.new('w', [2, 3])
        board.board[2][4] = Pawn.new('w', [2, 4])
        board.board[2][5] = Pawn.new('w', [2, 5])
      end
      it 'when king moves forward and capture enemey piece' do
        expect(king.valid_move?(board, [2, 4])).to be true
      end
      it 'when king moves ++ diagonal and capture enemey piece' do
        expect(king.valid_move?(board, [2, 5])).to be true
      end
      it 'when king moves right and capture enemey piece' do
        expect(king.valid_move?(board, [1, 5])).to be true
      end
      it 'when king moves +- diagonal and capture enemey piece' do
        expect(king.valid_move?(board, [0, 5])).to be true
      end
      it 'when king moves backwards and capture enemey piece' do
        expect(king.valid_move?(board, [0, 4])).to be true
      end
      it 'when king moves -- diagonal and capture enemey piece' do
        expect(king.valid_move?(board, [0, 3])).to be true
      end
      it 'when king moves left and capture enemey piece' do
        expect(king.valid_move?(board, [1, 3])).to be true
      end
      it 'when the king moves +- diagonal and capture enemey piece' do
        expect(king.valid_move?(board, [2, 3])).to be true
      end
    end
    context 'returns false' do
      let(:king) { described_class.new('b', [1, 4]) }
      before do
        board.board[2][3] = Pawn.new('b', [2, 3])
        board.board[2][4] = Pawn.new('b', [2, 4])
        board.board[2][5] = Pawn.new('b', [2, 5])
      end
      it 'when king moves forward and friendly peice present' do
        expect(king.valid_move?(board, [2, 4])).to be false
      end
      it 'when king moves ++ diagonal and friendly peice present' do
        expect(king.valid_move?(board, [2, 5])).to be false
      end
      it 'when king moves right and friendly peice present' do
        expect(king.valid_move?(board, [1, 5])).to be false
      end
      it 'when king moves +- diagonal and friendly peice present' do
        expect(king.valid_move?(board, [0, 5])).to be false
      end
      it 'when king moves backwards and friendly peice present' do
        expect(king.valid_move?(board, [0, 4])).to be false
      end
      it 'when king moves -- diagonal and friendly peice present' do
        expect(king.valid_move?(board, [0, 3])).to be false
      end
      it 'when king moves left and friendly peice present' do
        expect(king.valid_move?(board, [1, 3])).to be false
      end
      it 'when the king moves +- diagonal and friendly peice present' do
        expect(king.valid_move?(board, [2, 3])).to be false
      end
    end
    context 'returns true' do
      let(:king) { described_class.new('b', [2, 4]) }
      before do
        board.board = Array.new(8) { Array.new(8, nil) }
      end
      it 'when king moves forward two spaces without interference' do
        expect(king.valid_move?(board, [4, 4])).to be false
      end
      it 'when king moves ++ diagonal two spaces without interference' do
        expect(king.valid_move?(board, [6, 6])).to be false
      end
      it 'when king moves right two spaces without interference' do
        expect(king.valid_move?(board, [2, 6])).to be false
      end
      it 'when king moves +- diagonal two spaces without interference' do
        expect(king.valid_move?(board, [0, 6])).to be false
      end
      it 'when king moves backwards two spaces without interference' do
        expect(king.valid_move?(board, [0, 4])).to be false
      end
      it 'when king moves -- diagonal two spaces without interference' do
        expect(king.valid_move?(board, [0, 2])).to be false
      end
      it 'when king moves left two spaces without interference' do
        expect(king.valid_move?(board, [2, 2])).to be false
      end
      it 'when the king moves +- diagonal two spaces without interference' do
        expect(king.valid_move?(board, [4, 2])).to be false
      end
    end
  end
end
