require 'pg'
p 'setting up a test database...'

def setup_test_database
    connection = PG.connect(dbname: 'makersbnb_test')
    connection.exec("TRUNCATE listings, bookings, users;")
end
