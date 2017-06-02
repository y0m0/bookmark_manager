feature 'Signing Up' do
  scenario 'I can sign up with an email and password' do
   
    expect { sign_up }.to change(User, :count).by(1)
    expect(User.first.email).to eq 'tester@mail.com'

    #expect to be redirected to /links page
    expect(current_path).to eq '/links'

    expect(page).to have_content 'Welcome Tester'
    expect(page).to have_content 'tester@mail.com'
  end
end

