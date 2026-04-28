require_relative '../spec_helper'
require_relative '../../lib/chess/pieces/knight'

RSpec.describe Knight do
  context 'when peice is created' do
    let(:knight) { described_class.new('w', [1, 2]) }
    it 'has a color' do
      expect(knight.color).to eq('w')
    end
    it 'has a position' do
      expect(knight.position).to eq([1, 2])
    end
  end
end
