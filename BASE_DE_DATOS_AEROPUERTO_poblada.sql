CREATE DATABASE aeropuerto;
use aeropuerto

create table Airport
(
	id_airport int IDENTITY(1,1)  PRIMARY key,
	name VARCHAR(50) not null
);





create table Plane_Model
(
	id_plane_model int IDENTITY(1,1)  PRIMARY key,
	description VARCHAR(256),
	graphic VARCHAR(256)
)

create table Flight_Number
(
	id_flight_number int IDENTITY(1,1)  PRIMARY key ,
	id_airport_start int not null,
	id_airport_goal int not null,
	id_plane_model int not null,
	deperture_time time not null,
	description varchar(256),
	type VARCHAR(50),
	airline VARCHAR(100) not null,
	foreign key (id_airport_start) REFERENCES Airport (id_airport),
	foreign key (id_airport_goal) REFERENCES Airport (id_airport),
	foreign key (id_plane_model) REFERENCES Plane_Model(id_plane_model)
);

create table Airplane(
	id_airplane int IDENTITY(1,1)  PRIMARY key ,
	id_plane_model int not null,
	registration_numbre integer not null,
	begin_operacion date, 
	status varchar(50),
	foreign key (id_plane_model) REFERENCES Plane_Model(id_plane_model)
);

create table seat
(
	id_seat int IDENTITY(1,1) primary key ,
	id_plane_model int not null,
	size int not null,
	location char(50) not NULL
	foreign key (id_plane_model) REFERENCES Plane_Model(id_plane_model)
);

create table Flight
(
	id_flight int IDENTITY(1,1)  primary key ,
	id_flight_category int,
	boarding_time TIME not null,
	flight_date date not null,
	gate VARCHAR(50) null,
	check_in_counter varchar(256) not null,
	foreign key (id_flight_category) REFERENCES flight_category(id_category)
);

create table Frequent_Flyer_card
(
	id_ffc int IDENTITY(1,1)  primary key,
	ffc_numbre integer not null,
	miles integer not null,
	meal_code varchar(50) 
);

create table Customer
(
	id_customer int IDENTITY(1,1)  primary key,
	id_ffc int not null,
	date_bith date not null,
	id_document int not null,
	name varchar(256) not null,
	foreign key (id_ffc) REFERENCES Frequent_Flyer_card(id_ffc),
	foreign key (id_document) REFERENCES document(id_document)
);

create table ticket
(
	id_ticket int IDENTITY(1,1)  PRIMARY KEY,
	id_customer int not null,
	ticketing_code varchar(256) not null,
	number integer not null,
	foreign key (id_customer) REFERENCES Customer(id_customer)
);

create table 	Coupon
(
	id_coupon int IDENTITY(1,1)  PRIMARY key,
	id_ticket int not null,
	id_available_seat int,
	id_flight int not NULL,
	date_redemtion date not null,
	class varchar(50) not null,
	stanby char not null,
	meal_code varchar(50),
	foreign key (id_ticket) REFERENCES ticket(id_ticket),
	foreign key (id_flight) REFERENCES flight(id_flight),
	foreign key (id_available_seat) REFERENCES Available_Seat(id_available_seat)
);

create table Available_Seat
(
	id_available_seat int IDENTITY(1,1)  primary key,
	id_seat int not null,
	id_flight int not null,
	foreign key (id_flight) REFERENCES flight(id_flight),
	foreign key (id_seat) REFERENCES Seat(id_seat),
	
);



create table Pieces_Luggage
(
	id_pLuggage int IDENTITY(1,1)  primary key,
	id_coupon int not null,
	number integer not null,
	wight decimal(12,2) not null,
	foreign key (id_coupon) REFERENCES coupon(id_coupon)
);



create table pais(
	id_pais int IDENTITY(1,1) primary key,
	nombre varchar(50) not null
);

create table ciudad(
	id_ciudad int IDENTITY(1,1) primary key,
	id_pais integer not null,
	nombre varchar(50) not null,
	foreign key (id_pais) REFERENCES pais(id_pais)
);

create table ciudad_aeropuerto(
	id_ciudad int,
	id_airport int,
	primary key (id_ciudad, id_airport),
	foreign key (id_ciudad) REFERENCES ciudad(id_ciudad),
	foreign key (id_airport) REFERENCES Airport(id_airport)
);

create table document(
	id_document int IDENTITY primary key,
	descripcion varchar(50) not null
);

create table flight_category(
	id_category int IDENTITY(1,1),
	descripcion varchar(50) not null
);
