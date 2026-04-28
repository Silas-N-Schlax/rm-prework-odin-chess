require_relative '../spec_helper'
require_relative '../../lib/chess/pieces/king'

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
end
