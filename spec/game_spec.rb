require_relative 'spec_helper'
require_relative '../lib/game'

RSpec.describe Game do
  let(:game) { described_class.new }
  describe '#update_turn' do
    context 'when player turn is player 1' do
      it 'switched to player 2' do
        expect(game.update_turn).to eq(game.instance_variable_get(:@player_turn))
      end
    end
  end

  describe '#enemey_color' do
    context 'when player turn is player 1' do
      it 'returns "w" as enemey color' do
        expect(game.enemey_color).to eq('w')
      end
    end
    context 'when player turn is player 2' do
      it 'returns "b" as enemry color' do
        game.update_turn
        expect(game.enemey_color).to eq('b')
      end
    end
    context 'returns "Game Over" when checkmate has been established.' do
      before do
        allow(game).to receive(:gets).and_return(
          '52,53',
          '67,66',
          '41,85',
          '77,76',
          '85,74',
          '76,75',
          '74,85'
        )
      end
      it 'when black checkmates white with moves' do
        expect(game).to receive(:print).exactly(7).times
        expect(game.round).to eq('Game Over')
      end
    end
  end
end
