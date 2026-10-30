-- =============================================================
-- Library Database: views
-- A view is a saved query you can use like a table.
-- =============================================================

-- Loan report: member name, book title, loan and return dates
CREATE OR REPLACE VIEW v_loan_report AS
SELECT m.name  AS member_name,
       b.title AS book_title,
       l.loan_date,
       l.return_date
FROM loan l
JOIN member m ON l.member_id = m.member_id
JOIN book   b ON l.book_id   = b.book_id;

SELECT * FROM v_loan_report;
