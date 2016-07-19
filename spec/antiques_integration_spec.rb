require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('adding a product', {:type => :feature}) do
  it('allows the user to add products, and view them on the homepage') do
    visit('/')
    fill_in('description', :with => "lamp")
    fill_in('price', :with => 50.5)
    click_button('Add item')
    expect(page).to have_content('lamp')
  end
end

# describe('viewing sales between two specific dates', {:type => :feature}) do
#   it('allows the manager to select two dates, and see the sales between those two dates as well as the items sold') do
#     visit('/')
#     fill_in('description', :with => "lamp")
#     fill_in('price', :with => 50.5)
#     click_button('Add item')
#     fill_in('description', :with => "chair")
#     fill_in('price', :with => 123.5)
#     click_button('Add item')
#     click_link('Reports')
#     select("2016-07-20", :from => "start_date")
#     select("2016-07-28", :from => "end_date")
#     expect(page).to have_no_content('chair')
#   end
# end
