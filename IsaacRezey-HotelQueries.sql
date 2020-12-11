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

-- #5 Display # of Rooms reserved in April 2023 with 3+ guests
SELECT
	RoomNumber
FROM Reservation
WHERE (adults + children) >= 3 AND startDate BETWEEN '2023-04-01' AND '2023-04-30';

-- #6 Reservations made per guest
SELECT
	CONCAT(G.LastName, ", ", G.FirstName) AS Guest,
    COUNT(Res.ReservationId) AS ReservationsMade
FROM Guest AS G
LEFT OUTER JOIN Reservation AS Res
	ON Res.GuestId = G.GuestId
GROUP BY G.GuestId
ORDER BY ReservationsMade DESC, G.LastName;

-- #7 Display Name / Address / Phone# based on Arbitrary Phone#
SELECT
	CONCAT(LastName, ", ", FirstName) AS Guest,
    Address,
    Phone
FROM Guest
WHERE Phone = "3775070974";
