require './app/models/link'

feature 'view links' do

  before(:each) do
    Link.create(url: "http://www.hackaday.com/", title: "Hackaday", tags: [Tag.first_or_create(name: 'hacking')])
    Link.create(url: "http://www.reddit.com/", title: "Reddit", tags: [Tag.first_or_create(name: 'news')])
    Link.create(url: "http://www.google.com/", title: "Google", tags: [Tag.first_or_create(name: 'search')])
    Link.create(url: "http://programming-motherfucker.com/", title: "P-M", tags: [Tag.first_or_create(name: 'coding')])
  end

  scenario 'I want to see a list of links' do
    
    visit '/links'

    # check if the page is loaded correctly
    expect(page.status_code).to eq 200

    within 'ul#links' do
      expect(page).to have_content('Hackaday')
    end
  end

  scenario 'I can filter links by tag' do
    visit '/tags/coding'

    within 'ul#links' do
      expect(page).not_to have_content('Hackaday')
      expect(page).not_to have_content('Reddit')
      expect(page).not_to have_content('Google')
      expect(page).to have_content('P-M')
    end

  end
end
