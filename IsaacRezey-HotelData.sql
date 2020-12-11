USE HotelSchema;

INSERT INTO RoomType (RoomType, RoomOccupancy, MaxRoomOccupancy, ExtraPersonFee, Price, hasJacuzzi, hasOven) VALUES
	("Single", 2, 2, 0, 149.99, FALSE, FALSE),
    ("Double", 2, 4, 10, 174.99, FALSE, FALSE),
    ("Suite", 3, 8, 20, 399.99, FALSE, TRUE),
    ("SingleAndJacuzzi", 2, 2, 0, 174.99, TRUE, FALSE),
    ("DoubleAndJacuzzi", 2, 4, 10, 199.99, TRUE, FALSE);

INSERT INTO Room (RoomNumber, RoomTypeId, ADA, hasMicrowave, hasFridge) VALUES
	(201, 5,  FALSE,  TRUE,  FALSE),
	(202, 2,  TRUE,  FALSE,  TRUE),
	(203, 5,  FALSE,  TRUE,  FALSE),
	(204, 2,  TRUE,  FALSE,  TRUE),
	(205, 4,  FALSE,  TRUE,  TRUE),
	(206, 1,  TRUE,  TRUE,  TRUE),
	(207, 4,  FALSE,  TRUE,  TRUE),
	(208, 1,  TRUE,  TRUE,  TRUE),
	(301, 5,  FALSE,  TRUE,  FALSE),
	(302, 2,  TRUE,  FALSE,  TRUE),
	(303, 5,  FALSE,  TRUE,  FALSE),
	(304, 2,  TRUE,  FALSE,  TRUE),
	(305, 4,  FALSE,  TRUE,  TRUE),
	(306, 1,  TRUE,  TRUE,  TRUE),
	(307, 4,  FALSE,  TRUE,  TRUE),
	(308, 1,  TRUE,  TRUE,  TRUE),
	(401, 3,  TRUE,  TRUE,  TRUE),
	(402, 3,  TRUE,  TRUE,  TRUE);

INSERT INTO Guest(FirstName, LastName, Address, City, State, Zipcode, Phone) VALUES
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

INSERT INTO Reservation (RoomNumber, GuestId, Adults, Children, StartDate, EndDate, TotalCost) VALUES
	(308, 1, 1, 0, "2023-02-02", , 299.98),
	(203, 2, 2, 1, "2023-02-05", , 999.95),
	(305, 3, 2, 0, "2023-02-22", , 349.98),
	(201, 4, 2, 2, "2023-03-06", , 199.99),
-- 	(307, "Your Name", 1, 1, "3-17-2023", "3-20-2023", 524.97),
	(302, 5, 3, 0, "2023-03-18", , 924.95),
	(202, 6, 2, 2, "2023-03-29", , 349.98),
	(304, 7, 2, 0, "2023-03-31", , 874.95),
	(301, 8, 1, 0, "2023-04-09", , 799.96),
	(207, 9, 1, 1, "2023-04-23", , 174.99),
	(401, 10, 2, 4, "2023-05-30", , 1199.97),
	(206, 11, 2, 0, "2023-06-10", , 599.96),
	(208, 11, 1, 0, "2023-06-10", , 599.96),
	(304, 5, 3, 0, "2023-06-17", , 184.99),
-- 	(205, "Your Name", 2, 0, "6-28-2023", "7-2-2023", 699.96),
	(204, 8, 3, 1, "2023-07-13", , 184.99),
	(401, 9, 4, 2, "2023-07-18", , 1259.97),
	(303, 2, 2, 1, "2023-07-28", , 199.99),
	(305, 2, 1, 0, "2023-08-30", , 349.98),
	(208, 1, 2, 0, "2023-09-16", , 149.99),
	(203, 4, 2, 2, "2023-09-13", , 399.98),
	(401, 3, 2, 2, "2023-11-22", , 1199.97),
	(206, 1, 2, 0, "2023-11-22", , 449.97),
	(301, 1, 2, 2, "2023-11-22", , 599.97),
	(302, 10, 2, 0, "2023-12-24", , 699.96);
