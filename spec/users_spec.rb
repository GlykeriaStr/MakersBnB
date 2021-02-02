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

  describe '.authenticate' do
    it 'should check if there is a user with those details on the database' do
      user = User.create(email: 'hello@gmail', password: 'password', name: 'meg')
      id = user.id

      correct_user = User.authenticate(email:'hello@gmail', password: 'password')

      expect(correct_user).to be_a User
      expect(correct_user.id).to eq id
      expect(correct_user.email).to eq 'hello@gmail'
      expect(correct_user.name).to eq 'meg'
    end
  end
end
