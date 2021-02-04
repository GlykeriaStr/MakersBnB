feature 'a user can logout' do 
    scenario 'so that a user can end the session they can log out' do
        user = User.create(email: "jon@test.com", password: "blah", name: "jon")
        visit('/spaces')
        click_button 'Log Out'
        expect(current_path).to eq '/'
        expect(page).to have_content 'You have logged out!'
        
    end 
end 