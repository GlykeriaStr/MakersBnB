require_relative 'database_connection'
require 'pg'

class Booking

  attr_reader :id, :days, :listing_id, :user_id

  def initialize(id:, days: ,listing_id:, user_id:)
    @id = id
    @days = days
    @listing_id = listing_id
    @user_id = user_id
  end

  def self.create(listing_id:, user_id: )
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
    else
      connection = PG.connect(dbname: 'makersbnb')
    end
    result = connection.exec("INSERT INTO bookings (listing_id, user_id) VALUES (#{listing_id}, #{user_id}) RETURNING id, days, listing_id, user_id;").first
    Booking.new(id: result['id'], days: result['days'], listing_id: result['listing_id'], user_id: result['user_id'])
  end
end
