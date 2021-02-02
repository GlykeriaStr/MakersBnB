
class Spaces
attr_reader :name
    def initialize(name:)
        @name = name
    end 

    def self.create(name:)
        Spaces.new(name: 'first listing')

    end 
end 