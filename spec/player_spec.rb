require_relative 'spec_helper'
require_relative '../lib/chess/player'

RSpec.describe Player do
  context 'when player is created with name parm' do
    let(:new_player) { described_class.new('Bob') }
    it 'sets name to "Bob"' do
      expect(new_player.name).to eq('Bob')
    end
    it 'sets color to white (w)' do
      expect(new_player.color).to eq('w')
    end
  end

  context 'when player is created without name parm' do
    let(:new_player_no_name) { described_class.new }
    it 'sets name to "nil"' do
      expect(new_player_no_name.name).to be nil
    end
  end

  context 'when player is created with a name and color parm' do
    let(:new_player_all_parm) { described_class.new('Bob', 'b') }
    it 'sets name to "Bob"' do
      expect(new_player_all_parm.name).to eq('Bob')
    end
    it 'sets name to black (b)' do
      expect(new_player_all_parm.color).to eq('b')
    end
  end
end
