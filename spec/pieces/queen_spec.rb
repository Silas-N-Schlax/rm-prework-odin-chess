require_relative '../spec_helper'
require_relative '../../lib/chess/pieces/queen'

RSpec.describe Queen do
  context 'when peice is created' do
    let(:queen) { described_class.new('w', [1, 2]) }
    it 'has a color' do
      expect(queen.color).to eq('w')
    end
    it 'has a position' do
      expect(queen.position).to eq([1, 2])
    end
  end
end
