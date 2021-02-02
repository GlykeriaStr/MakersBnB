CREATE TABLE bookings (id SERIAL PRIMARY KEY, days INT, listing_id INTEGER REFERENCES listings(id));
ALTER TABLE bookings ADD user_id INTEGER REFERENCES users(id);
ALTER TABLE bookings ADD COLUMN status VARCHAR(20);
