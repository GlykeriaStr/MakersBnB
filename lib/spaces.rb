
class Spaces
attr_reader :name, :id
    def initialize(name:, id:)
        @name = name
        @id = id
    end 

    def self.create(name:)
        result = DatabaseConnection.query("INSERT INTO listings (name) VALUES ('#{name}') RETURNING id, name;")
        
        Spaces.new(name: result[0]['name'], id: result[0]['id'])

    end 
end 