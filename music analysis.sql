--Who is the senior most employee based on job title?
select * from employee
where hire_date=(select max(hire_date) from employee);

--What are the titles of all employees?
SELECT DISTINCT title 
FROM employees;

--How many customers are there in each country?
SELECT country, COUNT(customer_id) AS customer_count 
FROM customers 
GROUP BY country;

--What are the names of all genres?
SELECT name 
FROM genres;


--How many tracks are there in each album?
SELECT album_id, COUNT(track_id) AS track_count 
FROM tracks 
GROUP BY album_id;


--What is the total amount billed for each invoice?
SELECT invoice_id, SUM(total) AS total_amount 
FROM invoices 
GROUP BY invoice_id;

--How many tracks are there in each playlist?
SELECT p.name AS playlist_name, COUNT(pt.track_id) AS track_count 
FROM playlist_track pt 
JOIN playlists p ON pt.playlist_id = p.playlist_id 
GROUP BY p.name;


--What is the total revenue generated from each media type?
SELECT m.name AS media_type, SUM(il.unit_price * il.quantity) AS total_revenue 
FROM invoice_line il 
JOIN tracks t ON il.track_id = t.track_id 
JOIN media_types m ON t.media_type_id = m.media_type_id 
GROUP BY m.name;


--Who are the artists of each album?
SELECT a.name AS artist_name, al.title AS album_title 
FROM albums al 
JOIN artists a ON al.artist_id = a.artist_id;


--What are the addresses of all customers?
SELECT customer_id, address, city, state, country, postal_code 
FROM customers;


--What are the different types of media available?
SELECT DISTINCT name 
FROM media_types;


--How many invoices were issued in each country?
SELECT billing_country, COUNT(invoice_id) AS invoice_count 
FROM invoices 
GROUP BY billing_country;


--Which tracks belong to the "Rock" genre?
SELECT name 
FROM tracks 
WHERE genre_id = (SELECT genre_id FROM genres WHERE name = 'Rock');


--What is the total quantity of each track sold?
SELECT track_id, SUM(quantity) AS total_quantity_sold 
FROM invoice_line 
GROUP BY track_id;


