-- 1
SELECT b.cust_name
FROM restBill b
WHERE b.bill_total > 450.00
AND EXISTS (
    SELECT 1
    FROM restRoom_management rm
    JOIN restStaff hs ON rm.headwaiter = hs.staff_no
    WHERE hs.first_name = 'Charles'
      AND rm.room_date = b.bill_date
      AND EXISTS (
          SELECT 1
          FROM restRest_table rt
          WHERE rt.table_no = b.table_no
            AND rt.room_name = rm.room_name
      )
);

-- 2
SELECT hs.first_name, hs.surname
FROM restBill b
JOIN restStaff ws ON b.waiter_no = ws.staff_no
JOIN restStaff hs ON ws.headwaiter = hs.staff_no
WHERE b.cust_name = 'Nerida Smith'
  AND b.bill_date = 160111;

-- 3
SELECT b.cust_name
FROM restBill b
WHERE b.bill_total = (SELECT MIN(bill_total) FROM restBill);

-- 4
SELECT s.first_name, s.surname
FROM restStaff s
WHERE s.staff_no NOT IN (SELECT DISTINCT waiter_no FROM restBill);

-- 5
SELECT b.cust_name, hs.first_name AS headwaiter_first_name, hs.surname AS headwaiter_surname, rt.room_name
FROM restBill b
JOIN restRest_table rt ON b.table_no = rt.table_no
JOIN restRoom_management rm ON rt.room_name = rm.room_name AND b.bill_date = rm.room_date
JOIN restStaff hs ON rm.headwaiter = hs.staff_no
WHERE b.bill_total = (SELECT MAX(bill_total) FROM restBill);
