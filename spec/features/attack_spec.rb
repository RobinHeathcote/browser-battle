feature 'Attack:' do
  scenario 'attack player and receive confirmation' do
    sign_in_and_play
    click_button 'Attack'
    expect(page).to have_content ('Dave attacked Mittens')
  end

  scenario 'Player 1 attack Player 2' do
    allow(Kernel).to receive(:rand).and_return(10)
    sign_in_and_play
    attack_and_confirm
    expect(page).to have_content ('Mittens: 50HP')
  end
end
