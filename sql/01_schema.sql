-- =============================================================
-- Library Database: schema
-- Engine: PostgreSQL
-- Run this first. It removes old tables (if any) and creates them again.
-- =============================================================

DROP VIEW  IF EXISTS v_loan_report;
DROP TABLE IF EXISTS manage;
DROP TABLE IF EXISTS loan;
DROP TABLE IF EXISTS book;
DROP TABLE IF EXISTS librarian;
DROP TABLE IF EXISTS member;

-- People who borrow books
CREATE TABLE member (
    member_id  INT          PRIMARY KEY,
    name       VARCHAR(100) NOT NULL,
    phone      VARCHAR(20)  UNIQUE
);

-- Staff who manage books; shift must be one of three values
CREATE TABLE librarian (
    librarian_id  INT          PRIMARY KEY,
    name          VARCHAR(100) NOT NULL,
    shift_time    VARCHAR(50)  NOT NULL,
    CONSTRAINT chk_shift CHECK (shift_time IN ('Morning', 'Evening', 'Night'))
);

-- Books in the library
CREATE TABLE book (
    book_id  INT          PRIMARY KEY,
    title    VARCHAR(150) NOT NULL,
    author   VARCHAR(100) NOT NULL,
    section  VARCHAR(50)  NOT NULL
);

-- A member borrows a book. return_date is NULL while the book is still out.
CREATE TABLE loan (
    loan_id      INT  PRIMARY KEY,
    member_id    INT  NOT NULL,
    book_id      INT  NOT NULL,
    loan_date    DATE NOT NULL,
    return_date  DATE,

    CONSTRAINT fk_loan_member FOREIGN KEY (member_id) REFERENCES member (member_id),
    CONSTRAINT fk_loan_book   FOREIGN KEY (book_id)   REFERENCES book (book_id),
    CONSTRAINT chk_loan_dates CHECK (return_date IS NULL OR return_date >= loan_date)
);

-- A librarian is assigned to manage a book
CREATE TABLE manage (
    manage_id      INT  PRIMARY KEY,
    book_id        INT  NOT NULL,
    librarian_id   INT  NOT NULL,
    assigned_date  DATE NOT NULL,

    CONSTRAINT fk_manage_book      FOREIGN KEY (book_id)      REFERENCES book (book_id),
    CONSTRAINT fk_manage_librarian FOREIGN KEY (librarian_id) REFERENCES librarian (librarian_id),
    CONSTRAINT chk_assigned_date   CHECK (assigned_date >= '2020-01-01')
);
