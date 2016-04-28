feature 'game over' do
  context 'when Player reaches 0 HP' do
    before do
      sign_in_and_play
      attack_and_confirm
      allow(player_2).to receive(:hit_points) {0}
    end
    
  end

  scenario 'when a play reaches 0HP' do
    visit('/game_over')
      expect(page).to have_content "GAME OVER!"
  end
end
