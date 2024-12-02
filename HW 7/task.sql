{\rtf1\ansi\ansicpg1252\cocoartf2820
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\paperw11900\paperh16840\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0

\f0\fs24 \cf0 -- 1\
CREATE VIEW samsBills AS\
SELECT \
    s.first_name,\
    s.surname,\
    b.bill_date,\
    b.cust_name,\
    b.bill_total\
FROM restBill b\
JOIN restStaff s ON b.waiter_no = s.staff_no\
WHERE s.first_name = 'Sam' AND s.surname = 'Pitt';\
\
-- 2\
SELECT *\
FROM samsBills\
WHERE bill_total > 400;\
\
-- 3\
CREATE VIEW roomTotals AS\
SELECT \
    rt.room_name,\
    SUM(b.bill_total) AS total_sum\
FROM restBill b\
JOIN restRest_table rt ON b.table_no = rt.table_no\
GROUP BY rt.room_name;\
\
-- 4\
CREATE VIEW teamTotals AS\
SELECT \
    CONCAT(hs.first_name, ' ', hs.surname) AS headwaiter_name,\
    SUM(b.bill_total) AS total_sum\
FROM restBill b\
JOIN restStaff ws ON b.waiter_no = ws.staff_no\
JOIN restStaff hs ON ws.headwaiter = hs.staff_no\
GROUP BY hs.first_name, hs.surname;\
}