require 'user' 

describe User do 
    describe '.create' do 
        it ' should create a user' do 
            user = User.create(email: 'hello@gmail', password: 'password', name: 'meg')
            id = user.id 
            persisted_data = persisted_data_retrieve(table: 'users', id: id)

            expect(user).to be_a User
            expect(id).to eq persisted_data['id']
            expect(user.email).to eq 'hello@gmail'
            expect(user.name).to eq 'meg'
        end 
    end 
end 
    
