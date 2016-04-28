feature 'Attack:' do
  scenario 'attack player and receive confirmation' do
    sign_in_and_play
    click_button 'Attack'
    expect(page).to have_content ('Dave attacked Mittens')
  end

  scenario 'attack reduces opponents HP' do
    sign_in_and_play
    click_button 'Attack'
    expect(page).to have_content ('Mittens: 50HP')
  end
end
