require_relative '../spec_helper'
require_relative '../../lib/chess/pieces/bishop'
require_relative '../../lib/chess/board'

RSpec.describe Bishop do
  context 'when peice is created' do
    let(:bishop) { described_class.new('w', [1, 2]) }
    it 'has a color' do
      expect(bishop.color).to eq('w')
    end
    it 'has a position' do
      expect(bishop.position).to eq([1, 2])
    end
  end

  describe '#valid_move' do
    let(:board) { Board.new }
    let(:rook) { described_class.new('b', [0, 2]) }
    context 'returns true' do
      it 'when space is [2, 0]' do
        board.board[1][1] = nil
        expect(rook.valid_move?(board, [2, 0])).to be true
      end
      it 'when space is [2, 4]' do
        board.board[1][3] = nil
        expect(rook.valid_move?(board, [2, 4])).to be true
      end
    end
    context 'returns false' do
      it 'when space is [3, 0] and collision' do
        expect(rook.valid_move?(board, [3, 0])).to be false
      end
      it 'when space is [3, 3] and collision' do
        expect(rook.valid_move?(board, [3, 3])).to be false
      end
      it 'when space is [1, 1] and a friendly piece' do
        expect(rook.valid_move?(board, [1, 1])).to be false
      end
      it 'when space is [3, 2] and a is not a diagonal' do
        expect(rook.valid_move?(board, [3, 2])).to be false
      end
    end
  end
end
