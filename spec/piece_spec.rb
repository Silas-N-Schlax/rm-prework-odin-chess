require_relative 'spec_helper'
require_relative '../lib/chess/piece'

RSpec.describe Piece do
  context 'when a piece is created' do
    let(:piece) { described_class.new('w', [0, 1], '♖') }
    it 'has color' do
      expect(piece.color).to eq('w')
    end
    it 'has position' do
      expect(piece.position).to eq([0, 1])
    end
    it 'has white rook as peice' do
      expect(piece.bp).to eq('♖')
    end
  end
end
