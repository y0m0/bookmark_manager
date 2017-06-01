feature 'Add new tags' do
  scenario 'I can add a tag to a new link' do
    visit '/links/new'
    fill_in 'url',   with: 'http://www.reddit.com'
    fill_in 'title', with: 'Reddit'
    fill_in 'tags',   with: 'news'

    click_button('Save Bookmark')

    expect(Link.first.tags.map(&:name)).to include('news')
  end

  scenario 'I can add more then one tag to a new link' do
    visit '/links/new'
    fill_in 'url', with: 'http://www.reddit.com'
    fill_in 'title', with: 'Reddit'
    fill_in 'tags', with: 'news, hobbies, random'
    click_button('Save Bookmark')

    expect(Link.first.tags.map(&:name)).to include('news', 'hobbies', 'random')
  end
end
