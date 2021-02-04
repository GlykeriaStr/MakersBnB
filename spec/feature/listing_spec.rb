feature 'when on the spaces page' do 
    scenario 'a user can view the listings' do 
       user = User.create(email: 'test@address.com', password: 'password', name: 'name')
       space_1 = Spaces.create(name: 'apartment', description: 'modern', cost: '40', user_id: user.id)
       space_2 = Spaces.create(name: 'mansion', description: 'classic', cost: '30', user_id: user.id)
       spaces_3 = Spaces.create(name: 'studio', description: 'retro', cost: '20', user_id: user.id)
        visit('/spaces')
        expect(page).to have_css '.listings'
        expect(page).to have_content 'apartment'
        expect(page).to have_content 'mansion'
        expect(page).to have_content 'studio'

    end 
end 

        
