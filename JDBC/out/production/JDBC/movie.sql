drop database movie_booking;
CREATE DATABASE movie_booking;

-- Use the created database
USE movie_booking;

-- Create the users table
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(50) NOT NULL
);
select * from users;
DROP TABLE IF EXISTS bookings;
CREATE TABLE bookings (
    id INT AUTO_INCREMENT PRIMARY KEY,  -- Use this as the primary key
    user_id INT NOT NULL,
    movie_name VARCHAR(100) NOT NULL,
    seats INT NOT NULL,
    booking_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    priceLabel DECIMAL(10, 2),  -- Column to store the total price
    FOREIGN KEY (user_id) REFERENCES users(id)
);
ALTER TABLE bookings ADD COLUMN price DECIMAL(10, 2);
SELECT 
    users.id AS user_id, 
    users.username, 
    users.password, 
    bookings.id AS booking_id,  -- Use 'id' from bookings as booking_id
    bookings.movie_name, 
    bookings.seats, 
    bookings.booking_time, 
    bookings.priceLabel
FROM users
INNER JOIN bookings ON users.id = bookings.user_id;

ALTER TABLE users ADD COLUMN phone_number VARCHAR(15);

ALTER TABLE bookings ADD COLUMN time_slot VARCHAR(20);


drop table bookings;