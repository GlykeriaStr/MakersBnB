require './lib/spaces'
require_relative 'persisted_data'

describe Spaces do
  describe '.create' do
    it 'Should create a new listing' do
      listing = Spaces.create(name: 'first listing')
      id = listing.id
      persisted_data = persisted_data_retrieve(table: 'listings', id: id)

      expect(listing).to be_a Spaces
      expect(id).to eq persisted_data['id']
      expect(listing.name).to eq 'first listing'
    end
  end
end
