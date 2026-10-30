-- =============================================================
-- Library Database: queries
-- Each query starts with the question it answers.
-- =============================================================

-- Q1. Which books are in the IT section?
SELECT *
FROM book
WHERE section = 'IT';

-- Q2. Which books are NOT in the Programming section?
SELECT *
FROM book
WHERE section <> 'Programming';

-- Q3. How many books does the library have?
SELECT COUNT(*) AS total_books
FROM book;

-- Q4. How many loans does each member have?
SELECT member_id, COUNT(*) AS total_loans
FROM loan
GROUP BY member_id;

-- Q5. Who made the earliest loan? (subquery)
SELECT member_id, loan_date
FROM loan
WHERE loan_date = (SELECT MIN(loan_date) FROM loan);

-- Q6. Which member borrowed which book, and when? (JOIN of 3 tables)
SELECT m.name  AS member_name,
       b.title AS book_title,
       l.loan_date
FROM loan l
JOIN member m ON l.member_id = m.member_id
JOIN book   b ON l.book_id   = b.book_id;

-- Q7. Which books did one specific member borrow? (member 1023)
SELECT m.member_id,
       m.name  AS member_name,
       b.title AS book_title
FROM book b
JOIN loan   l ON b.book_id   = l.book_id
JOIN member m ON l.member_id = m.member_id
WHERE l.member_id = 1023;

-- ---------- Added in the 2026 update ----------

-- Q8. Which books are still out (not returned yet)?
SELECT b.title, m.name AS member_name, l.loan_date
FROM loan l
JOIN book   b ON l.book_id   = b.book_id
JOIN member m ON l.member_id = m.member_id
WHERE l.return_date IS NULL;

-- Q9. How many days did each returned loan last?
SELECT loan_id, return_date - loan_date AS days_borrowed
FROM loan
WHERE return_date IS NOT NULL
ORDER BY days_borrowed DESC;

-- Q10. How many books does each librarian manage? (LEFT JOIN keeps librarians with 0 books)
SELECT lb.name, lb.shift_time, COUNT(mg.book_id) AS books_managed
FROM librarian lb
LEFT JOIN manage mg ON lb.librarian_id = mg.librarian_id
GROUP BY lb.librarian_id, lb.name, lb.shift_time
ORDER BY books_managed DESC;
