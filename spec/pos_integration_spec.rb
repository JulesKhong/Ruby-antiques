require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('pos path', {:type => :feature}) do
  it('shows a list of all unsold products')do
    visit('/')
    fill_in('description', :with => "lamp")
    fill_in('price', :with => 50.5)
    click_button('Add item')
    visit('/pos')
    expect(page).to have_content('lamp')
  end
end
