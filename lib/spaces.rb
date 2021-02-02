require_relative 'database_connection'

class Spaces

  attr_reader :id, :name

  if ENV['ENVIRONMENT'] == 'test'
    connection = PG.connect(dbname: 'makersbnb_test')
  else
    connection = PG.connect(dbname: 'makersbnb')
  end

  def initialize(id:, name:)
    @id = id
    @name = name
  end

  def self.create(name:)
    result = connection.exec("INSERT INTO listings (name) VALUES ('#{name}') RETURNING id, name;")
    Spaces.new(id: result[0]['id'], name: result[0]['name'])
  end

  def self.all
    result = connection.exec("SELECT * FROM listings;")
    # result.map do |listing|
    #   Spaces.new(id: listing[0]["id"], name: listing[0]["name"])
    # end
  end

end
