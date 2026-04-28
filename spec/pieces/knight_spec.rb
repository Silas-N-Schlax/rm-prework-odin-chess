require_relative '../spec_helper'
require_relative '../../lib/chess/pieces/knight'

RSpec.describe Knight do
  let(:knight) { described_class.new('w', [0, 1]) }
  context 'when peice is created' do
    it 'has a color' do
      expect(knight.color).to eq('w')
    end
    it 'has a position' do
      expect(knight.position).to eq([0, 1])
    end
  end

  describe '#valid_move' do
    context 'returns true' do
      it 'when space is [2, 0]' do
        expect(knight.valid_move?([2, 0])).to be true
      end
      it 'when space is [2, 2]' do
        expect(knight.valid_move?([2, 2])).to be true
      end
      it 'when space is [7, 6]' do
        expect(knight.valid_move?([6, 4], [7, 6]))
      end
    end
    context 'returns false' do
      it 'when space is [0, 0]' do
        expect(knight.valid_move?([0, 0])).to be false
      end
    end
  end
end
