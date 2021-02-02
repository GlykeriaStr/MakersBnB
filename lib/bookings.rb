require 'database_connection'

class Bookings

  attr_reader :id, :start_date, :end_date, :listing_id

  def initialize(id:, start_date:, end_date: ,listing_id:)
    @id = id
    @start_date = start_date
    @end_date = end_date
    @listing_id = listing_id
  end
#
#   def self.book(start_date:, end_date:)
#     result = DatabaseConnection.query("INSERT INTO bookings (start_date, end_date) VALUES (#{start_date}, #{end_date}) RETURNING id, start_date, end_date, listing_id;").first
#     Bookings.new(id: result['id'], start_date: result['start_date'], end_date: result['end_date'], listing_id: result['listing_id'])
#   end
end
