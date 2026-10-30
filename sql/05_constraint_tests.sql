-- =============================================================
-- Library Database: constraint tests
-- Each INSERT below breaks one rule on purpose.
-- Every one of them SHOULD FAIL with an error. That proves the rule works.
-- Run each test on its own (select it, then Ctrl+Enter).
-- =============================================================

-- Test 1: UNIQUE phone
-- Phone 0500000005 already belongs to member 1155.
-- Expected: ERROR duplicate key value violates unique constraint
INSERT INTO member (member_id, name, phone)
VALUES (1200, 'Test Member', '0500000005');

-- Test 2: CHECK shift_time
-- 'Afternoon' is not one of Morning, Evening, Night.
-- Expected: ERROR violates check constraint "chk_shift"
INSERT INTO librarian (librarian_id, name, shift_time)
VALUES (506, 'Test Librarian', 'Afternoon');

-- Test 3: CHECK assigned_date
-- 2019 is before the allowed start date (2020-01-01).
-- Expected: ERROR violates check constraint "chk_assigned_date"
INSERT INTO manage (manage_id, book_id, librarian_id, assigned_date)
VALUES (8006, 3001, 501, '2019-11-11');

-- ---------- Added in the 2026 update ----------

-- Test 4: CHECK loan dates
-- Return date (Nov 1) is before loan date (Nov 10).
-- Expected: ERROR violates check constraint "chk_loan_dates"
INSERT INTO loan (loan_id, member_id, book_id, loan_date, return_date)
VALUES (9006, 1001, 3001, '2025-11-10', '2025-11-01');

-- Test 5: FOREIGN KEY
-- Member 9999 does not exist.
-- Expected: ERROR violates foreign key constraint "fk_loan_member"
INSERT INTO loan (loan_id, member_id, book_id, loan_date, return_date)
VALUES (9007, 9999, 3001, '2025-11-10', NULL);
