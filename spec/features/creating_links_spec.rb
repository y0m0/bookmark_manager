feature 'Save a website' do
  scenario 'can add the website address and title to the bookmark list' do
    visit('/links/new')
    fill_in('url', with: 'https://www.reddit.com')
    fill_in('title', with: 'Reddit')
    click_button('Save Bookmark')

    #expect to be redirected back to /links
    expect(current_path).to eq '/links'

    within 'ul#links' do
      expect(page).to have_content('https://www.reddit.com')
      expect(page).to have_content('Reddit')
    end
  end
end
