require 'booking'
require 'persisted_data'
require 'spaces'

describe Booking do
  describe '.create' do

    it 'should request a booking' do
      user = User.create(email: 'hello@gmail', password: 'password', name: 'meg')
      user_id = user.id
      listing = Spaces.create(name: 'first listing', description: 'Lovely place', cost: 60, user_id: user.id)
      listing_id = listing.id
      booking = Booking.create(listing_id: listing_id, user_id: user_id )
      id = booking.id
      persisted_data = persisted_data_retrieve(table: 'bookings', id: id)

      expect(booking).to be_a Booking
      expect(booking.listing_id).to eq listing_id
      expect(booking.user_id).to eq user_id
      expect(booking.id).to eq persisted_data['id']
    end
  end
end
# delete this sentence
