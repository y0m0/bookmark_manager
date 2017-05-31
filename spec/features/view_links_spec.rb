require './app/models/link'

feature 'view links' do
  scenario 'I want to see a list of links' do
    Link.create(url: "http://hackaday.com/", title: "Hackaday")
    visit '/links'
    # to check if this works
    # within 'ul#links' do
    expect(page).to have_content('Hackaday')
  end
end
