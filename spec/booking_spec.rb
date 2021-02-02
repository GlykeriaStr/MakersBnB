require 'booking'
require 'persisted_data'

describe Booking do
  describe '.create' do
    it 'should request a booking' do
      # listing = Spaces.create(name: 'first listing')
      booking = Booking.create(start_date: 2021-02-17, end_date: 2021-02-19)
      id = booking.id
      persisted_data = persisted_data_retrieve(table: 'bookings', id: id)

      expect(booking).to be_a Booking
      expect(booking.start_date).to eq 2021-02-17
      expect(booking.end_date).to eq 2021-02-19
      expect(booking.id).to eq persisted_data['id']
    end
  end
end
