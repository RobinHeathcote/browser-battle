feature 'Enter names' do
  scenario 'submitting names' do
    sign_in_and_play
    expect(page).to have_content 'Dave vs. Mittens'
  end
end
feature 'Hit points' do
  scenario 'view other players hit points' do
    sign_in_and_play
    expect(page).to have_content ('Mittens: 60HP')
  end
end

feature 'Attack' do
  scenario 'attack player and receive confirmation' do
    sign_in_and_play
    click_button 'Attack'
    expect(page).to have_content ('Dave attacked Mittens')
  end
end
