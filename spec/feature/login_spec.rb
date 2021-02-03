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
end 


