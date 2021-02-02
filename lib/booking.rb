require 'database_connection'
require 'pg'

class Booking

  attr_reader :id, :days, :listing_id

  def initialize(id:, days: ,listing_id:)
    @id = id
    @days = days
    @listing_id = listing_id
  end

  def self.create(days:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
    else
      connection = PG.connect(dbname: 'makersbnb')
    end
    result = connection.exec("INSERT INTO bookings (days) VALUES (#{days}) RETURNING id, days, listing_id;").first
    Booking.new(id: result['id'], days: result['days'], listing_id: result['listing_id'])
  end
end


