CREATE TABLE IF NOT EXISTS houses(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(50) NOT NULL,
	image_name VARCHAR(255),
	description VARCHAR(255) NOT NULL,
	price INT NOT NULL,
	capacity INT NOT NULL,
	postal_code VARCHAR(50) NOT NULL,
	address VARCHAR(255) NOT NULL,
	phone_number VARCHAR(50) NOT NULL,
	created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);	 

CREATE TABLE IF NOT EXISTS roles (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS users (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    furigana VARCHAR(50) NOT NULL,
    postal_code VARCHAR(50) NOT NULL,
    address VARCHAR(255) NOT NULL,
    phone_number VARCHAR(50) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,    
    role_id INT NOT NULL, 
    enabled BOOLEAN NOT NULL,
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,    
    FOREIGN KEY (role_id) REFERENCES roles (id)
);

CREATE TABLE IF NOT EXISTS verification_tokens (
     id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
     user_id INT NOT NULL UNIQUE,
     token VARCHAR(255) NOT NULL,        
     created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
     updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
     FOREIGN KEY (user_id) REFERENCES users (id) 
 );
 
CREATE TABLE IF NOT EXISTS reservations (
     id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
     house_id INT NOT NULL,
     user_id INT NOT NULL,
     checkin_date DATE NOT NULL,
     checkout_date DATE NOT NULL,
     number_of_people INT NOT NULL,
     amount INT NOT NULL,
     created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
     updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
     FOREIGN KEY (house_id) REFERENCES houses (id),
     FOREIGN KEY (user_id) REFERENCES users (id)
 );
 
CREATE TABLE IF NOT EXISTS reviews (
     id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
     house_id INT NOT NULL,
     user_id INT NOT NULL,
     score INT NOT NULL,
     comment TEXT NOT NULL, 
     created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
     updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
     FOREIGN KEY (house_id) REFERENCES houses (id),
     FOREIGN KEY (user_id) REFERENCES users (id)
 );
 
CREATE TABLE IF NOT EXISTS favorites (
     id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
     house_id INT NOT NULL,
     user_id INT NOT NULL,
     created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
     updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
     FOREIGN KEY (house_id) REFERENCES houses (id),
     FOREIGN KEY (user_id) REFERENCES users (id)
 );