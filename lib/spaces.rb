require_relative 'database_connection'

class Spaces

  attr_reader :id, :name

  def initialize(id:, name:)
    @id = id
    @name = name
  end

  def self.create(name:)
    result = DatabaseConnection.query("INSERT INTO listings (name) VALUES ('#{name}') RETURNING id, name;")
    Spaces.new(id: result[0]['id'], name: result[0]['name'])
  end

end
