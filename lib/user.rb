require 'bcrypt'

class User

  attr_reader :id, :email, :password, :name
  
  def initialize(id:, email:, password:, name:)
    @id = id
    @email = email
    @password = password
    @name = name
  end

  def self.create(email:, password:, name:)
    secret_password = BCrypt::Password.create(password)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
    else
      connection = PG.connect(dbname: 'makersbnb')
    end
      result = connection.exec("INSERT INTO users (email, password, name) VALUES ('#{email}', '#{secret_password}', '#{name}') RETURNING id, email, password, name;").first
      User.new(id: result['id'], email: result['email'], password: ['password'], name: result['name'])
   end

end