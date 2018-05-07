describe 'Calculator', type: :feature do
  before do
    visit '/'
    within('#calculateForm') do
      fill_in('rate', with: 10)
      fill_in('amount', with: 100000)
      fill_in('term', with: 6)
      choose('payoff-standart')
      click_button('button')
    end
  end

  it 'has title' do
    expect(page).to have_content('График погашения платежей')
  end
end