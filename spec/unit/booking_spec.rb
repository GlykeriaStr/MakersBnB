require 'booking'
require 'persisted_data'
require 'spaces'

describe Booking do
  describe '.create' do

    it 'should request a booking' do
      listing = Spaces.create(name: 'first listing')
      booking = Booking.create(days: 2)
      id = booking.id
      persisted_data = persisted_data_retrieve(table: 'bookings', id: id)

      expect(booking).to be_a Booking
      expect(booking.days).to eq '2'
      # expect(booking.end_date).to eq 2021-02-19
      expect(booking.id).to eq persisted_data['id']
    end
  end
end
# delete this sentence
