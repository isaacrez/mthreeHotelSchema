USE HotelSchema;

-- #1: List of reservations ending in July, 2023
SELECT
	CONCAT(G.LastName, ", ", G.FirstName) AS Guest,
    Res.RoomNumber,
    CONCAT(Res.startDate, " - ", Res.endDate) AS TimeReserved
FROM Reservation AS Res
INNER JOIN Guest AS G
	ON G.GuestId = Res.GuestId
WHERE Res.endDate BETWEEN "2023-07-01" AND "2023-07-30";

-- RESULTS:
-- Rezey, Isaac	205	2023-06-28 - 2023-07-02
-- Holaway, Walter	204	2023-07-13 - 2023-07-14
-- Vise, Wilfred	401	2023-07-18 - 2023-07-21
-- Seery, Bettyann	303	2023-07-28 - 2023-07-29

-- #2: List of reservations with Jacuzzi's
SELECT
	CONCAT(G.LastName, ", ", G.FirstName) AS Guest,
	Res.RoomNumber,
    CONCAT(Res.startDate, " - ", Res.endDate) AS TimeReserved
FROM Reservation AS Res
INNER JOIN Guest AS G
	ON Res.GuestId = G.GuestId
INNER JOIN RoomAmenity AS RA
	ON Res.RoomNumber = RA.RoomNumber
INNER JOIN Amenity AS A
	ON RA.AmenityId = A.AmenityId
WHERE A.Name = 'Jacuzzi';

-- RESULTS:
-- Yang, Karie	201	2023-03-06 - 2023-03-07
-- Seery, Bettyann	203	2023-02-05 - 2023-02-10
-- Yang, Karie	203	2023-09-13 - 2023-09-15
-- Rezey, Isaac	205	2023-06-28 - 2023-07-02
-- Vise, Wilfred	207	2023-04-23 - 2023-04-24
-- Holaway, Walter	301	2023-04-09 - 2023-04-13
-- Simmer, Mack	301	2023-11-22 - 2023-11-25
-- Seery, Bettyann	303	2023-07-28 - 2023-07-29
-- Cullison, Duane	305	2023-02-22 - 2023-02-24
-- Seery, Bettyann	305	2023-08-30 - 2023-09-01

-- #3: Display all Reservations & info (RoomNumbers / ReservationStart / TotalPeople)
-- 		for Arbitrary Person ("Karie Yang")
SELECT
	CONCAT(G.LastName, ", ", G.FirstName) AS Guest,
    Res.RoomNumber,
    Res.startDate,
    (Res.adults + Res.children) AS totalPeople
FROM Reservation AS Res
INNER JOIN Guest AS G
	ON G.GuestId = Res.GuestId
WHERE G.FirstName = "Karie" AND G.LastName = "Yang";

-- RESULTS
-- Yang, Karie	201	2023-03-06	4
-- Yang, Karie	203	2023-09-13	4

-- #4 Display All Rooms & their associated Reservations
SELECT
	Rm.RoomNumber,
	Res.ReservationId,
	DATEDIFF(Res.endDate, Res.startDate) *
		(RT.Price +
		IF(RT.RoomOccupancy < Res.adults,
			(Res.adults - RT.RoomOccupancy) * RT.ExtraPersonFee,
			0)
		) AS ReservationCost
FROM Room AS Rm
LEFT OUTER JOIN Reservation AS Res
	ON Res.RoomNumber = Rm.RoomNumber
INNER JOIN RoomType AS RT
	ON RT.RoomTypeId = Rm.RoomTypeId
ORDER BY Rm.RoomNumber;

-- RESULTS
-- 201	4	199.99
-- 202	7	349.98
-- 203	2	999.95
-- 203	21	399.98
-- 204	16	184.99
-- 205	15	699.96
-- 206	12	599.96
-- 206	23	449.97
-- 207	10	174.99
-- 208	13	599.96
-- 208	20	149.99
-- 301	9	799.96
-- 301	24	599.97
-- 302	6	924.95
-- 302	25	699.96
-- 303	18	199.99
-- 304	14	184.99
-- 305	3	349.98
-- 305	19	349.98
-- 306	NULL	NULL
-- 307	5	524.97
-- 308	1	299.98
-- 401	11	1199.97
-- 401	17	1259.97
-- 401	22	1199.97
-- 402	NULL	NULL

-- #5 Display # of Rooms reserved in April 2023 with 3+ guests
SELECT
	RoomNumber
FROM Reservation
WHERE (adults + children) >= 3 AND startDate BETWEEN '2023-04-01' AND '2023-04-30';

-- RESULTS
-- [[ None ]]

-- #6 Reservations made per guest
SELECT
	CONCAT(G.LastName, ", ", G.FirstName) AS Guest,
    COUNT(Res.ReservationId) AS ReservationsMade
FROM Guest AS G
LEFT OUTER JOIN Reservation AS Res
	ON Res.GuestId = G.GuestId
GROUP BY G.GuestId
ORDER BY ReservationsMade DESC, G.LastName;

-- RESULTS
-- Simmer, Mack	4
-- Seery, Bettyann	3
-- Cullison, Duane	2
-- Holaway, Walter	2
-- Lipton, Aurore	2
-- Rezey, Isaac	2
-- Tilton, Maritza	2
-- Tison, Joleen	2
-- Vise, Wilfred	2
-- Yang, Karie	2
-- Luechtefeld, Zachery	1

-- #7 Display Name / Address / Phone# based on Arbitrary Phone#
SELECT
	CONCAT(LastName, ", ", FirstName) AS Guest,
    Address,
    Phone
FROM Guest
WHERE Phone = "3775070974";

-- RESULTS
-- Lipton, Aurore	762 Wild Rose Street	3775070974
