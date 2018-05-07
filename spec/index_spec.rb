describe 'Index', type: :feature do
  it 'has name of form' do
    visit '/'
    expect(page).to have_content('Кредитный онлайн-калькулятор')
  end
end