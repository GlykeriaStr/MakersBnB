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
end
