require_relative '../spec_helper'
require_relative '../../lib/chess/pieces/queen'
require_relative '../../lib/chess/board'

RSpec.describe Queen do
  context 'when peice is created' do
    let(:queen) { described_class.new('w', [1, 2]) }
    it 'has a color' do
      expect(queen.color).to eq('w')
    end
    it 'has a position' do
      expect(queen.position).to eq([1, 2])
    end
  end

  describe '#valid_move' do
    let(:board) { Board.new }
    context 'returns true' do
      let(:queen) { described_class.new('b', [1, 3]) }
      before do
        board.board = Array.new(8) { Array.new(8, nil) }
      end
      it 'when queen moves left with no interference' do
        expect(queen.valid_move?(board, [1, 0])).to be true
      end
      it 'when queen moves right with no interference' do
        expect(queen.valid_move?(board, [1, 7])).to be true
      end
      it 'when the queen moves forward with no interference' do
        expect(queen.valid_move?(board, [1, 3])).to be true
      end
      it 'when the queen moves ++ diagonal with not interference' do
        expect(queen.valid_move?(board, [5, 7])).to be true
      end
      it 'when the queen moves +- diagonal with not interference' do
        expect(queen.valid_move?(board, [0, 4])).to be true
      end
      it 'when the queen moves -- diagonal with no interference' do
        expect(queen.valid_move?(board, [0, 2])).to be true
      end
      it 'when the queen moves +- diagonal with no interference' do
        expect(queen.valid_move?(board, [4, 0])).to be true
      end
    end
    context 'returns false' do
      let(:queen) { described_class.new('b', [0, 3]) }
      it 'when queen moves left with interference' do
        expect(queen.valid_move?(board, [1, 0])).to be false
      end
      it 'when queen moves right with interference' do
        expect(queen.valid_move?(board, [1, 7])).to be false
      end
      it 'when the queen moves forward with interference' do
        expect(queen.valid_move?(board, [1, 3])).to be false
      end
      it 'when the queen moves ++ diagonal with not interference' do
        expect(queen.valid_move?(board, [5, 7])).to be false
      end
      it 'when the queen moves +- diagonal with not interference' do
        expect(queen.valid_move?(board, [0, 4])).to be false
      end
      it 'when the queen moves -- diagonal with interference' do
        expect(queen.valid_move?(board, [0, 2])).to be false
      end
      it 'when the queen moves +- diagonal with no interference' do
        expect(queen.valid_move?(board, [4, 0])).to be false
      end
    end
    context 'returns true' do
      let(:queen) { described_class.new('g', [1, 3]) }
      before do
        board.board[2][2] = Queen.new('w', [2, 2])
        board.board[2][4] = Queen.new('w', [2, 3])
        board.board[2][3] = Queen.new('w', [2, 4])
      end
      it 'when queen moves left with capture' do
        expect(queen.valid_move?(board, [1, 2])).to be true
      end
      it 'when queen moves right with capture' do
        expect(queen.valid_move?(board, [1, 4])).to be true
      end
      it 'when the queen moves forward with capture' do
        expect(queen.valid_move?(board, [2, 3])).to be true
      end
      it 'when the queen moves ++ diagonal with not interference' do
        expect(queen.valid_move?(board, [2, 4])).to be true
      end
      it 'when the queen moves +- diagonal with not interference' do
        expect(queen.valid_move?(board, [0, 4])).to be true
      end
      it 'when the queen moves -- diagonal with capture' do
        expect(queen.valid_move?(board, [0, 2])).to be true
      end
      it 'when the queen moves +- diagonal with no interference' do
        expect(queen.valid_move?(board, [2, 2])).to be true
      end
    end
  end
end
