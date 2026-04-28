require_relative 'spec_helper'
require_relative '../lib/chess/board'

RSpec.describe Board do
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
