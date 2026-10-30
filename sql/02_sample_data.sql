-- =============================================================
-- Library Database: sample data
-- All names and phone numbers are made up for testing.
-- =============================================================

INSERT INTO member (member_id, name, phone) VALUES
(1001, 'Ali Ahmed',     '0500000001'),
(1023, 'Sara Omar',     '0500000002'),
(1050, 'Mohanad Saleh', '0500000003'),
(1102, 'Lama Hassan',   '0500000004'),
(1155, 'Reem Khalid',   '0500000005');

INSERT INTO librarian (librarian_id, name, shift_time) VALUES
(501, 'Fatimah Ali',   'Morning'),
(502, 'Omar Nasser',   'Evening'),
(503, 'Huda Mohammed', 'Night'),
(504, 'Yousef Sami',   'Morning'),
(505, 'Ahlam Saad',    'Evening');

INSERT INTO book (book_id, title, author, section) VALUES
(3001, 'Database Systems',           'Elmasri',       'IT'),
(3010, 'Learning SQL',               'Alan Beaulieu', 'IT'),
(3025, 'Clean Code',                 'Robert Martin', 'Programming'),
(3150, 'Python Crash Course',        'Eric Matthes',  'Programming'),
(4000, 'Introduction to Algorithms', 'Cormen',        'CS');

INSERT INTO loan (loan_id, member_id, book_id, loan_date, return_date) VALUES
(9001, 1001, 3001, '2025-11-01', '2025-11-10'),
(9002, 1023, 3025, '2025-11-03', NULL),
(9003, 1050, 3010, '2025-11-05', '2025-11-15'),
(9004, 1102, 4000, '2025-11-06', NULL),
(9005, 1155, 3150, '2025-11-07', '2025-11-16');

INSERT INTO manage (manage_id, book_id, librarian_id, assigned_date) VALUES
(8001, 3001, 501, '2025-10-01'),
(8002, 3010, 501, '2025-10-02'),
(8003, 3025, 502, '2025-10-03'),
(8004, 3150, 503, '2025-10-04'),
(8005, 4000, 504, '2025-10-05');
