require_relative '../spec_helper'
require_relative '../../lib/chess/pieces/knight'

RSpec.describe Knight do
  let(:knight) { described_class.new('w', [1, 2]) }
  context 'when peice is created' do
    it 'has a color' do
      expect(knight.color).to eq('w')
    end
    it 'has a position' do
      expect(knight.position).to eq([1, 2])
    end
  end

  describe '#valid_move' do
    let(:from) { [0, 1] }
    context 'returns true' do
      it 'when space is [2, 0]' do
        expect(knight.valid_move?(from, [2, 0])).to be true
      end
      it 'when space is [2, 2]' do
        expect(knight.valid_move?(from, [2, 2])).to be true
      end
    end
    context 'returns false' do
      it 'when space is [0, 0]' do
        expect(knight.valid_move?(from, [0, 0])).to be false
      end
    end
  end
end
