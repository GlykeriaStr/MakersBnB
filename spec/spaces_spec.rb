require './lib/spaces'
require_relative 'persisted_data'

describe Spaces do
  describe '.create' do
    it 'Should create a new listing' do
      user = User.create(email: 'hello@gmail', password: 'password', name: 'meg')
      listing = Spaces.create(name: 'first listing', description: 'Lovely place', cost: 60, user_id: user.id)
      id = listing.id
      persisted_data = persisted_data_retrieve(table: 'listings', id: id)

      expect(listing).to be_a Spaces
      expect(id).to eq persisted_data['id']
      expect(listing.name).to eq 'first listing'
      expect(listing.description).to eq 'Lovely place'
      expect(listing.cost).to eq '60'
    end
  end

  describe '.all' do
    it 'should show all the spaces' do
      user = User.create(email: 'hello@gmail', password: 'password', name: 'meg')
      listing = Spaces.create(name: 'first listing', description: 'Lovely place', cost: 60, user_id: user.id)
      Spaces.create(name: 'second listing', description: 'playing time', cost: 30, user_id: user.id)
      Spaces.create(name: 'third listing', description: 'our third place', cost: 50, user_id: user.id)

      spaces = Spaces.all

      expect(spaces.length).to eq 3
      expect(spaces.first).to be_a Spaces
      expect(spaces.first.id).to eq listing.id
      expect(spaces.first.name).to eq listing.name
    end
  end

  describe '.find_by_id' do
    it 'should find a listing by its id' do
      user = User.create(email: 'hello@gmail', password: 'password', name: 'meg')
      space =Spaces.create(name: 'fourth listing', description: 'our fourth place', cost: 50, user_id: user.id)
      id  = space.id

      returned_listing = Spaces.find_by_id(id: id)

      expect(returned_listing).to be_a Spaces
      expect(returned_listing.id).to eq id
      expect(returned_listing.name).to eq space.name
      expect(returned_listing.description).to eq space.description
    end
  end
end
