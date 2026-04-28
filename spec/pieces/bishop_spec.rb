require_relative '../spec_helper'
require_relative '../../lib/chess/pieces/bishop'

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
end
