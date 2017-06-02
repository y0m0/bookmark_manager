def sign_up
    visit '/users/new'
    fill_in 'username', with: 'Tester'
    fill_in 'email', with: 'tester@mail.com'
    fill_in 'password', with: 'pa$$w0rd'
    fill_in 'password_confirmation', with: 'pa$$w0rd'
    click_button 'Sign Up'
end
