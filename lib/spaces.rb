require_relative 'database_connection'

class Spaces

  attr_reader :id, :name, :description, :cost, :user_id

  def initialize(id:, name:, description:, cost:, user_id:)
    @id = id
    @name = name
    @description = description
    @cost = cost
    @user_id = user_id
  end

  def self.create(name:, description:, cost:, user_id:)
    return nil unless user_id

    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
    else
      connection = PG.connect(dbname: 'makersbnb')
    end
    result = connection.exec("INSERT INTO listings (name, description, cost, user_id) VALUES ('#{name}', '#{description}', '#{cost}', #{user_id}) RETURNING id, name, description, cost, user_id;").first
    Spaces.new(id: result['id'], name: result['name'], description: result['description'], cost: result['cost'], user_id: result['user_id'])
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
    else
      connection = PG.connect(dbname: 'makersbnb')
    end
    result = connection.exec("SELECT * FROM listings;")
    result.map do |listing|
      Spaces.new(id: listing['id'], name: listing['name'], description: listing['description'], cost: listing['cost'], user_id: listing['user_id'])
    end
  end

  def self.find_by_id(id:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
    else
      connection = PG.connect(dbname: 'makersbnb')
    end
    result = connection.exec("SELECT * FROM listings WHERE id = #{id};").first
    Spaces.new(id: result['id'], name: result['name'], description: result['description'], cost: result['cost'], user_id: result['user_id'])
  end

end
