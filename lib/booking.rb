require_relative 'database_connection'
require 'pg'

class Booking

  attr_reader :id, :listing_id, :user_id, :availability

  def initialize(id:, listing_id:, user_id:, availability:)
    @id = id
    @listing_id = listing_id
    @user_id = user_id
    @availability = availability
  end

  def self.create(listing_id:, user_id:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
    else
      connection = PG.connect(dbname: 'makersbnb')
    end
    result = connection.exec("INSERT INTO bookings (listing_id, user_id) VALUES (#{listing_id}, #{user_id}) RETURNING id, listing_id, user_id, availability;").first
    Booking.new(id: result['id'], listing_id: result['listing_id'], user_id: result['user_id'], availability: result['availability'])
  end
end
