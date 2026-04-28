require_relative '../spec_helper'
require_relative '../../lib/chess/pieces/pawn'

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
end
