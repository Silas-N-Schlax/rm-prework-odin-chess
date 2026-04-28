require_relative '../spec_helper'
require_relative '../../lib/chess/pieces/rook'
require_relative '../../lib/chess/board'

RSpec.describe Rook do
  context 'when peice is created' do
    let(:rook) { described_class.new('b', [0, 0]) }
    it 'has a color' do
      expect(rook.color).to eq('b')
    end
    it 'has a position' do
      expect(rook.position).to eq([0, 0])
    end
  end
  describe '#valid_move' do
    let(:board) { Board.new }
    let(:rook) { described_class.new('b', [0, 0]) }
    context 'returns true' do
      it 'when space is [0, 1]' do
        board.board[0][1] = nil
        expect(rook.valid_move?(board, [0, 1])).to be true
      end
      it 'when space is [4, 0]' do
        board.board[1][0] = nil
        expect(rook.valid_move?(board, [4, 0])).to be true
      end
      it 'when space is [4, 0] and a capture' do
        board.board[1][0] = nil
        board.board[4][0] = Rook.new('w', [4, 0])
        expect(rook.valid_move?(board, [4, 0])).to be true
      end
    end
    context 'returns false' do
      it 'when space is [0, 1] and collision' do
        expect(rook.valid_move?(board, [0, 1])).to be false
      end
      it 'when space is [4, 0] and collision' do
        expect(rook.valid_move?(board, [4, 0])).to be false
      end
      it 'when space is [4, 0] and a friendly piece' do
        expect(rook.valid_move?(board, [4, 0])).to be false
      end
    end
  end
end
