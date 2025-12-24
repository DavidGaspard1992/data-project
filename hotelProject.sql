CREATE DATABASE Sql_hotel;
use Sql_hotel;

CREATE TABLE Country (
    country_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	countryName varchar(50),
	Created_at datetime not null default current_timestamp,
    updated_at datetime null default now() on update now(),
    delete_at datetime null
);

CREATE TABLE city (
	city_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    cityName varchar (50),
    country_id int,
    FOREIGN KEY (country_id) REFERENCES country (country_id),
    created_at datetime not null default now(),
    updated_at datetime null default now() on update now(),
    delete_at datetime null
);

CREATE TABLE address (
    address_id int primary key not null auto_increment,
    lat varchar (50),
    lng varchar (50),
    zip_code varchar (20) not null,
    street varchar (120),
    city_id int,
    FOREIGN KEY (city_id) references city (city_id)
);

CREATE TABLE brand (
	brand_id int not null primary key auto_increment,
    brandName varchar (50),
    brand_code varchar (20),
	created_at datetime not null default now(),
    update_at datetime null default now() on update now(),
    delete_ate datetime null
); 

CREATE TABLE customer (
	customer_id int not null primary key auto_increment,
    customerName varchar (100),
    created_at datetime not null default now(),
    update_at datetime null default now() on update now(),
    delete_ate datetime null
);

CREATE TABLE hotel (
	hotel_id int not null primary key auto_increment,
    hotelName varchar (100),
    hotel_code varchar (50),
    hotel_description varchar (250),
	reservation_email varchar (30),
    rating int,
    address_id int,
    brand_id int,
    FOREIGN KEY (address_id) REFERENCES address (address_id),
    FOREIGN KEY (brand_id) REFERENCES brand (brand_id),
    created_at datetime not null default now(),
    update_at datetime null default now() on update now(),
    delete_ate datetime null
);

CREATE TABLE benefit (
	benefit_id int not null primary key auto_increment,
    benefit_description varchar(100),
	created_at datetime not null default now(),
    update_at datetime null default now() on update now(),
    delete_ate datetime null
);

CREATE TABLE hotel_benefit(
	primary key hotel_benefit (hotel_id,benefit_id), 
    hotel_id int,
    benefit_id int,
    FOREIGN KEY (hotel_id) REFERENCES hotel (hotel_id),
    FOREIGN KEY (benefit_id) REFERENCES benefit (benefit_id),
	created_at datetime not null default now(),
    update_at datetime null default now() on update now(),
    delete_ate datetime null
);

CREATE TABLE room(
	room_id int not null primary key auto_increment,
    price decimal (10,2),
    hotel_id int,
    room_status varchar (50),
    FOREIGN KEY (hotel_id) REFERENCES hotel(hotel_id),
    created_at datetime not null default now(),
    update_at datetime null default now() on update now(),
    delete_ate datetime null
);

CREATE TABLE booking (
	booking_id int not null primary key auto_increment,
    hotel_id int,
    FOREIGN KEY (hotel_id) REFERENCES hotel (hotel_id),
    created_at datetime not null default now(),
    update_at datetime null default now() on update now(),
    delete_ate datetime null
);

CREATE TABLE bookingRoom(
	primary key bookingRoom (booking_id, room_id),
    booking_id int,
    room_id int,
    FOREIGN KEY (booking_id) REFERENCES booking (booking_id),
    FOREIGN KEY (room_id) REFERENCES room (room_id),
    created_at datetime not null default now(),
    update_at datetime null default now() on update now(),
    delete_ate datetime null
);

CREATE TABLE bill (
	bill_id int not null primary key auto_increment,
    total_amount decimal (10,2),
    created_at datetime not null default now(),
    update_at datetime null default now() on update now(),
    delete_ate datetime null
);

CREATE TABLE payment (
	 payment_id int not null primary key auto_increment,
     amount decimal (10,2),
     fee decimal (10,2),
     method varchar (30), -- (creditCard, cash, transfer)
     taxes decimal (10,2),
	 created_at datetime not null default now(),
     update_at datetime null default now() on update now(),
     delete_ate datetime null
);