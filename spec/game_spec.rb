require 'game'

describe Game do
  subject(:game) { Game.new(player_1, player_2) }
  let(:player_1) {  double(:player, name: 'Dave') }
  let(:player_2) {  double(:player, name: 'Mittins') }

  describe "Initialization" do
    it "retrieves the first player" do
    	expect(game.player_1).to eq player_1
    end

    it "retrieves the second player" do
    	expect(game.player_2).to eq player_2
    end
  end

  describe '#attack' do
    it 'damages the player' do
      expect(player_2).to receive(:receive_damage)
      game.attack
    end
  end

  describe '#switcher' do
    it 'switches turns after attack' do
      game.switcher
      expect(game.current_player).to eq player_2
    end
  end

  describe '#game_over?' do
    it 'ends game if player HP = 0' do
      allow(player_1).to receive(:hit_points) {0}
      expect(game.game_over?).to be true
    end
  end

end
