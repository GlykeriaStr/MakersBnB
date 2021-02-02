CREATE TABLE bookings (id SERIAL PRIMARY KEY, days INT, listing_id INTEGER REFERENCES listings(id));
