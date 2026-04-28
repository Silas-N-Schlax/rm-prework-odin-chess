require_relative '../spec_helper'
require_relative '../../lib/chess/pieces/rook'

RSpec.describe Rook do
  context 'when peice is created' do
    let(:rook) { described_class.new('w', [1, 2]) }
    it 'has a color' do
      expect(rook.color).to eq('w')
    end
    it 'has a position' do
      expect(rook.position).to eq([1, 2])
    end
  end
end
