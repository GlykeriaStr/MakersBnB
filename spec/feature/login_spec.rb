feature 'a user has access to MakersBnB' do
  scenario 'A user can login' do
    sign_up_and_register
    visit('/login')
    fill_in("email", with: "Test@address.com")
    fill_in("password", with: "TestPassword")
    click_button("Log in")
    expect(current_path).to eq '/spaces'
    expect(page).to have_content("Book a Space")
  end

  scenario 'You get a flash notice if you put wrong email' do
    user = User.create(email: 'hello@gmail', password: 'password', name: 'meg')
    visit('/login')
    fill_in("email", with: "Test@address.com")
    fill_in("password", with: "password")
    click_button("Log in")
    expect(page).to have_content("Please check your email or password.")
  end

  scenario 'you get a flash notice if you put in wrong password' do
    user = User.create(email: 'hello@gmail', password: 'password', name: 'meg')
    visit('/login')
    fill_in('email', with: 'hello@gmail')
    fill_in("password", with: "hello")
    click_button("Log in")
    expect(page).to have_content("Please check your email or password.")
  end
end
