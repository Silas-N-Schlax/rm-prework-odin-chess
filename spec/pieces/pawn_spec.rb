require_relative '../spec_helper'
require_relative '../../lib/chess/pieces/pawn'
require_relative '../../lib/chess/board'

RSpec.describe Pawn do
  context 'when peice is created' do
    let(:pawn) { described_class.new('w', [1, 2]) }
    it 'has a color' do
      expect(pawn.color).to eq('w')
    end
    it 'has a position' do
      expect(pawn.position).to eq([1, 2])
    end
  end

  describe '#valid_move' do
    let(:board) { Board.new }
    context 'when black pawn moves' do
      let(:rook) { described_class.new('b', [1, 0]) }
      context 'returns true' do
        it 'when space is [2, 0]' do
          expect(rook.valid_move?(board, [2, 0])).to be true
        end
        it 'when space is [3, 0] and pawn is in starting position' do
          expect(rook.valid_move?(board, [3, 0])).to be true
        end
        it 'when space is [2, 1] and capture' do
          board.board[2][1] = Pawn.new('w', [2, 1])
          expect(rook.valid_move?(board, [2, 1])).to be true
        end
      end
      context 'returns false' do
        it 'when space is [0, 0]' do
          expect(rook.valid_move?(board, [0, 0])).to be false
        end
        it 'when space is [0, 0] and rook has been removed' do
          board.board[0][0] = nil
          expect(rook.valid_move?(board, [0, 0])).to be false
        end
        it 'when space is [4, 0]' do
          expect(rook.valid_move?(board, [4, 0])).to be false
        end
        it 'when space is [2, 1] and no capture' do
          expect(rook.valid_move?(board, [2, 1])).to be false
        end
        it 'when space is [2, 1] and peice is friendly' do
          board.board[2][1] = Pawn.new('b', [2, 1])
          expect(rook.valid_move?(board, [2, 1])).to be false
        end
        it 'when space is [3, 2] (out of bound capture attempt)' do
          expect(rook.valid_move?(board, [3, 2])).to be false
        end
        it 'when space is [0, 1]' do
          expect(rook.valid_move?(board, [0, 1])).to be false
        end
        it 'when space is [0, 1] and space is empty' do
          board.board[0][1] = nil
          expect(rook.valid_move?(board, [0, 1])).to be false
        end
        it 'when space is [3, 2] and peice in between' do
          board.board[2][1] = Pawn.new('w', [2, 1])
          expect(rook.valid_move?(board, [3, 2])).to be false
        end
        it 'when space is [0, 1] and enemy peice' do
          board.board[0][1] = Pawn.new('w', [0, 1])
          expect(rook.valid_move?(board, [0, 1])).to be false
        end
        it 'when space is [1, 2]' do
          expect(rook.valid_move?(board, [1, 2])).to be false
        end
        it 'when space is [1, 2] and space is empty' do
          board.board[1][2] = nil
          expect(rook.valid_move?(board, [1, 2])).to be false
        end
      end
    end
    context 'when white pawn moves' do
      let(:rook) { described_class.new('w', [6, 0]) }
      context 'returns true' do
        it 'when space is [5, 0]' do
          expect(rook.valid_move?(board, [5, 0])).to be true
        end
        it 'when space is [4, 0] and pawn is in starting position' do
          expect(rook.valid_move?(board, [4, 0])).to be true
        end
        it 'when space is [5, 1] and capture' do
          board.board[5][1] = Pawn.new('b', [5, 1])
          expect(rook.valid_move?(board, [5, 1])).to be true
        end
      end
      context 'returns false' do
        it 'when space is [7, 0]' do
          expect(rook.valid_move?(board, [7, 0])).to be false
        end
        it 'when space is [7, 0] and rook has been removed' do
          board.board[7][0] = nil
          expect(rook.valid_move?(board, [7, 0])).to be false
        end
        it 'when space is [3, 0]' do
          expect(rook.valid_move?(board, [3, 0])).to be false
        end
        it 'when space is [5, 1] and no capture' do
          expect(rook.valid_move?(board, [5, 1])).to be false
        end
        it 'when space is [4, 2] (out of bound capture attempt)' do
          expect(rook.valid_move?(board, [4, 2])).to be false
        end
        it 'when space is [5, 1] and peice is friendly' do
          board.board[5][1] = Pawn.new('w', [5, 1])
          expect(rook.valid_move?(board, [5, 1])).to be false
        end
        it 'when space is [7, 1]' do
          expect(rook.valid_move?(board, [7, 1])).to be false
        end
        it 'when space is [0, 1] and space is empty' do
          board.board[7][1] = nil
          expect(rook.valid_move?(board, [7, 1])).to be false
        end
        it 'when space is [4, 2] and peice in between' do
          board.board[3][1] = Pawn.new('w', [3, 1])
          expect(rook.valid_move?(board, [4, 2])).to be false
        end
        it 'when space is [7, 1] and enemy peice' do
          board.board[7][1] = Pawn.new('b', [7, 1])
          expect(rook.valid_move?(board, [7, 1])).to be false
        end
      end
    end
  end
end
