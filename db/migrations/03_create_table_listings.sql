CREATE TABLE listings(id SERIAL PRIMARY KEY, name VARCHAR(60), description VARCHAR(180), cost INT);
ALTER TABLE listings ADD user_id INTEGER REFERENCES users(id);
