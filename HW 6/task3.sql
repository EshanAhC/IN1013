-- 1
SELECT T1.first_name T1.surname
FROM restStaff T1 INNER JOIN restBill T2
ON T1.staff_no = T2.waiter_no
WHERE cust_name = "Tanya Singh";

-- 2
SELECT rm.room_date
FROM restRoom_management rm
JOIN restStaff s ON rm.headwaiter = s.staff_no
WHERE s.first_name = 'Charles'
  AND rm.room_name = 'Green'
  AND rm.room_date BETWEEN 160201 AND 160229;

-- 3
SELECT s.first_name, s.surname
FROM restStaff s
WHERE s.headwaiter = (
    SELECT headwaiter
    FROM restStaff
    WHERE first_name = 'Zoe' AND surname = 'Ball'
);

-- 4
SELECT b.cust_name, b.bill_total, s.first_name AS waiter_first_name, s.surname AS waiter_surname
FROM restBill b
JOIN restStaff s ON b.waiter_no = s.staff_no
ORDER BY b.bill_total DESC;

-- 5
SELECT s.first_name, s.surname
FROM restBill b
JOIN restStaff s ON b.waiter_no = s.staff_no
WHERE s.headwaiter = (
    SELECT DISTINCT s2.headwaiter
    FROM restBill b2
    JOIN restStaff s2 ON b2.waiter_no = s2.staff_no
    WHERE b2.bill_no IN (14, 17)
);

-- 6
SELECT s.first_name, s.surname
FROM restStaff s
WHERE s.headwaiter = (
    SELECT headwaiter
    FROM restRoom_management
    WHERE room_name = 'Blue' AND room_date = 160312
)
OR s.staff_no = (
    SELECT headwaiter
    FROM restRoom_management
    WHERE room_name = 'Blue' AND room_date = 160312
);