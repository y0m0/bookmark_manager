feature 'Signing Up' do
  scenario 'I can sign up with an email and password' do
   
    expect { sign_up }.to change(User, :count).by(1)
    expect(User.first.email).to eq 'tester@mail.com'

    #expect to be redirected to /links page
    expect(current_path).to eq '/links'

    expect(page).to have_content 'Welcome Tester'
    expect(page).to have_content 'tester@mail.com'
  end
  
  scenario 'so I don\'t make a typo when signing up I need to confirm my password' do
    user_count = User.count
    
    visit '/users/new'
    fill_in 'username', with: 'Tester'
    fill_in 'email', with: 'tester@mail.com'
    fill_in 'password', with: 'pa$$w0rd'
    fill_in 'password_confirmation', with: 'abcd'
    click_button 'Sign Up'
    
    expect(User.count).to eq user_count
  end
end
