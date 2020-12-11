USE HotelSchema;

INSERT INTO RoomType (RoomType, RoomOccupancy, MaxRoomOccupancy, ExtraPersonFee, Price) VALUES
	("Single", 2, 2, 0, 149.99),
    ("Double", 2, 4, 10, 174.99),
    ("Suite", 3, 8, 20, 399.99),
    ("SingleAndJacuzzi", 2, 2, 0, 174.99),
    ("DoubleAndJacuzzi", 2, 4, 10, 199.99);

INSERT INTO Room (RoomNumber, RoomTypeId, ADA) VALUES
	(201, 5, FALSE),
	(202, 2, TRUE),
	(203, 5, FALSE),
	(204, 2, TRUE),
	(205, 4, TRUE),
	(206, 1, TRUE),
	(207, 4, TRUE),
	(208, 1, TRUE),
	(301, 5, FALSE),
	(302, 2, TRUE),
	(303, 5, FALSE),
	(304, 2, TRUE),
	(305, 4, TRUE),
	(306, 1, TRUE),
	(307, 4, TRUE),
	(308, 1, TRUE),
	(401, 3, TRUE),
	(402, 3, TRUE);

INSERT INTO Amenity (Name) VALUES 
	("Microwave"),
    ("Jacuzzi"),
    ("Refridgerator"),
    ("Oven");

INSERT INTO RoomAmenity (RoomNumber, AmenityId) VALUES
	(201, 1),
	(201, 2),
	(202, 3),
	(203, 1),
	(203, 2),
	(204, 3),
	(205, 1),
	(205, 3),
	(205, 2),
	(206, 1),
	(206, 3),
	(207, 1),
	(207, 3),
	(207, 2),
	(208, 1),
	(208, 3),
	(301, 1),
	(301, 2),
	(302, 3),
	(303, 1),
	(303, 2),
	(304, 3),
	(305, 1),
	(305, 3),
	(305, 2),
	(306, 1),
	(306, 3),
	(306, 2),
	(308, 1),
	(308, 3),
	(401, 1),
	(401, 3),
	(401, 4),
	(402, 1),
	(402, 3),
	(402, 4);

INSERT INTO Guest(FirstName, LastName, Address, City, State, Zipcode, Phone) VALUES
    ("Isaac", "Rezey", "128 Broadway Blvd", "Viridian Forest", "MN", "12345", "3085182244"),
	("Mack", "Simmer", "379 Old Shore Street", "Council Bluffs", "IA", "51501", "2915530508"),
	("Bettyann", "Seery", "750 Wintergreen Dr.", "Wasilla", "AK", "99654", "4782779632"),
	("Duane", "Cullison", "9662 Foxrun Lane", "Harlingen", "TX", "78552", "3084940198"),
	("Karie", "Yang", "9378 W. Augusta Ave.", "West Deptford", "NJ", "8096", "2147300298"),
	("Aurore", "Lipton", "762 Wild Rose Street", "Saginaw", "MI", "48601", "3775070974"),
	("Zachery", "Luechtefeld", "7 Poplar Dr.", "Arvada", "CO", "80003", "8144852615"),
	("Jeremiah", "Pendergrass", "70 Oakwood St.", "Zion", "IL", "60099", "2794910960"),
	("Walter", "Holaway", "7556 Arrowhead St.", "Cumberland", "RI", "2864", "4463966785"),
	("Wilfred", "Vise", "77 West Surrey Street", "Oswego", "NY", "13126", "8347271001"),
	("Maritza", "Tilton", "939 Linda Rd.", "Burke", "VA", "22015", "4463516860"),
	("Joleen", "Tison", "87 Queen St.", "Drexel Hill", "PA", "19026", "2318932755");

INSERT INTO Reservation (RoomNumber, GuestId, Adults, Children, StartDate, EndDate) VALUES
	(308, 2, 1, 0, "2023-02-02", "2023-02-04"),
	(203, 3, 2, 1, "2023-02-05", "2023-02-10"),
	(305, 4, 2, 0, "2023-02-22", "2023-02-24"),
	(201, 5, 2, 2, "2023-03-06", "2023-03-07"),
	(307, 1, 1, 1, "2023-03-17", "2023-03-20"),
	(302, 6, 3, 0, "2023-03-18", "2023-03-23"),
	(202, 7, 2, 2, "2023-03-29", "2023-03-31"),
	(304, 8, 2, 0, "2023-03-31", "2023-04-05"),
	(301, 9, 1, 0, "2023-04-09", "2023-04-13"),
	(207, 10, 1, 1, "2023-04-23", "2023-04-24"),
	(401, 11, 2, 4, "2023-05-30", "2023-06-02"),
	(206, 12, 2, 0, "2023-06-10", "2023-06-14"),
	(208, 12, 1, 0, "2023-06-10", "2023-06-14"),
	(304, 6, 3, 0, "2023-06-17", "2023-06-18"),
	(205, 1, 2, 0, "2023-06-28", "2023-07-02"),
	(204, 9, 3, 1, "2023-07-13", "2023-07-14"),
	(401, 10, 4, 2, "2023-07-18", "2023-07-21"),
	(303, 3, 2, 1, "2023-07-28", "2023-07-29"),
	(305, 3, 1, 0, "2023-08-30", "2023-09-01"),
	(208, 2, 2, 0, "2023-09-16", "2023-09-17"),
	(203, 5, 2, 2, "2023-09-13", "2023-09-15"),
	(401, 4, 2, 2, "2023-11-22", "2023-11-25"),
	(206, 2, 2, 0, "2023-11-22", "2023-11-25"),
	(301, 2, 2, 2, "2023-11-22", "2023-11-25"),
	(302, 11, 2, 0, "2023-12-24", "2023-12-28");
