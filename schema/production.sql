--
-- DATABASE CODE LIBRARY
--

CREATE DATABASE code_library_production;
\c code_library_production


--
-- SCHEMA IDENTITY
--

CREATE SCHEMA identity;

CREATE TABLE identity.users (
  id SERIAL PRIMARY KEY,
  sub VARCHAR(255) NOT NULL,
  email VARCHAR(50) NOT NULL,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  picture bytea,
  oauth_access_token VARCHAR(256) NOT NULL,
  oauth_access_token_valid TIMESTAMP NOT NULL,
  oauth_refresh_token VARCHAR(256) NOT NULL,
  oauth_refresh_token_valid TIMESTAMP NOT NULL
);

CREATE TABLE identity.roles (
  id SERIAL PRIMARY KEY,
  role_name VARCHAR(50) NOT NULL,
  access_manage_books BOOLEAN NOT NULL,
  access_manage_roles BOOLEAN NOT NULL
);

CREATE TABLE identity.users_roles (
  id SERIAL PRIMARY KEY,
  user_id INTEGER NOT NULL REFERENCES identity.users (id) ON UPDATE CASCADE ON DELETE CASCADE UNIQUE,
  role_id INTEGER NOT NULL REFERENCES identity.roles (id) ON UPDATE CASCADE ON DELETE CASCADE
);


--
-- SCHEMA BOOKS
--

CREATE SCHEMA book;

CREATE TABLE book.tags (
  id SERIAL PRIMARY KEY,
  name VARCHAR(50) NOT NULL
);

CREATE TABLE book.designations (
  id SERIAL PRIMARY KEY,
  name VARCHAR(10) NOT NULL
);

CREATE TABLE book.persons (
  id SERIAL PRIMARY KEY,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  date_of_birth DATE,
  isni VARCHAR(20),
  orcid VARCHAR(20),
  oclc VARCHAR(20)
);

CREATE TABLE book.publishers (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL
);

CREATE TABLE book.series (
  id SERIAL PRIMARY KEY,
  publisher_id INTEGER NOT NULL REFERENCES book.publishers (id) ON UPDATE CASCADE ON DELETE RESTRICT
);

CREATE TABLE book.languages (
  id SERIAL PRIMARY KEY,
  iso_code VARCHAR(7) NOT NULL,
  language_name VARCHAR(200) NOT NULL
);

CREATE TABLE book.physical_sizes (
  id SERIAL PRIMARY KEY,
  name VARCHAR(50) NOT NULL
);

CREATE TABLE book.subject_areas (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL
);

CREATE TABLE book.books (
  id SERIAL PRIMARY KEY,
  isbn_13 VARCHAR(13),
  issn VARCHAR(20),
  title VARCHAR(200) NOT NULL,
  subtitle VARCHAR(200),
  description TEXT,
  cover INTEGER,
  edition INTEGER,
  release_year SMALLINT CHECK (release_year >= 0),
  pages INTEGER,
  code_identifier VARCHAR(10) UNIQUE,
  publisher_id INTEGER NOT NULL REFERENCES book.publishers (id) ON UPDATE CASCADE ON DELETE RESTRICT,
  designation_id INTEGER NOT NULL REFERENCES book.designations (id) ON UPDATE CASCADE ON DELETE RESTRICT,
  series_id INTEGER REFERENCES book.series (id) ON UPDATE CASCADE ON DELETE RESTRICT,
  language_id INTEGER NOT NULL REFERENCES book.languages (id) ON UPDATE CASCADE ON DELETE RESTRICT,
  physical_size_id INTEGER NOT NULL REFERENCES book.physical_sizes (id) ON UPDATE CASCADE ON DELETE RESTRICT
);

CREATE TABLE book.books_subject_areas (
  id SERIAL PRIMARY KEY,
  book_id INTEGER NOT NULL REFERENCES book.books (id) ON UPDATE CASCADE ON DELETE CASCADE,
  subject_area_id INTEGER NOT NULL REFERENCES book.subject_areas (id) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE book.books_tags (
  id SERIAL PRIMARY KEY,
  book_id INTEGER NOT NULL REFERENCES book.books (id) ON UPDATE CASCADE ON DELETE CASCADE,
  tag_id INTEGER NOT NULL REFERENCES book.tags (id) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE book.statuses (
  id SERIAL PRIMARY KEY,
  name VARCHAR(50) NOT NULL UNIQUE,
  available BOOLEAN NOT NULL,
  bookable BOOLEAN NOT NULL
);

CREATE TABLE book.copies (
  id SERIAL PRIMARY KEY,
  book_id INTEGER NOT NULL REFERENCES book.books (id) ON UPDATE CASCADE ON DELETE RESTRICT,
  status_id INTEGER NOT NULL REFERENCES book.statuses (id) ON UPDATE CASCADE ON DELETE RESTRICT,
  code_identifier_copy_id INTEGER,
  date_added DATE NOT NULL DEFAULT CURRENT_DATE
);

CREATE TABLE book.books_authors (
  id SERIAL PRIMARY KEY,
  book_id INTEGER NOT NULL REFERENCES book.books (id) ON UPDATE CASCADE ON DELETE RESTRICT,
  person_id INTEGER NOT NULL REFERENCES book.persons (id) ON UPDATE CASCADE ON DELETE RESTRICT
);

CREATE TABLE book.books_editors (
  id SERIAL PRIMARY KEY,
  book_id INTEGER NOT NULL REFERENCES book.books (id) ON UPDATE CASCADE ON DELETE RESTRICT,
  person_id INTEGER NOT NULL REFERENCES book.persons (id) ON UPDATE CASCADE ON DELETE RESTRICT
);

CREATE FUNCTION book.copies_book_id_create_seq() RETURNS trigger AS
  $$
  BEGIN
    IF EXISTS (SELECT * FROM book.copies WHERE book_id = NEW.book_id) THEN
      NEW.code_identifier_copy_id := nextval(format('book.copies_code_identifier_%s_seq', NEW.book_id));
      return NEW;
    ELSE
      EXECUTE format('CREATE SEQUENCE book.copies_code_identifier_%s_seq', NEW.book_id);
      NEW.code_identifier_copy_id := nextval(format('book.copies_code_identifier_%s_seq', NEW.book_id));
      return NEW;
    END IF;
  END
  $$ LANGUAGE plpgsql;

CREATE TRIGGER copies_book_id_create_seq BEFORE INSERT ON book.copies FOR EACH ROW EXECUTE PROCEDURE book.copies_book_id_create_seq();

CREATE FUNCTION book.copies_book_id_delete_seq() RETURNS trigger AS
  $$
  BEGIN
    IF (SELECT COUNT(*) FROM book.copies WHERE book_id = OLD.book_id) = 0 THEN
      EXECUTE format('DROP SEQUENCE book.copies_code_identifier_%s_seq', OLD.book_id);
    END IF;
    RETURN OLD;
  END
  $$ LANGUAGE plpgsql;

CREATE TRIGGER copies_book_id_delete_seq AFTER DELETE ON book.copies FOR EACH ROW EXECUTE PROCEDURE book.copies_book_id_delete_seq();


--
-- SCHEMA borrow
--

CREATE SCHEMA borrow;

CREATE TABLE borrow.copies_users_active (
  id SERIAL PRIMARY KEY,
  copy_id INTEGER NOT NULL REFERENCES book.copies (id) ON UPDATE CASCADE ON DELETE RESTRICT UNIQUE, -- do not allow to delete a book copy, if it is lend to a user
  user_id INTEGER NOT NULL REFERENCES identity.users (id) ON UPDATE CASCADE ON DELETE RESTRICT, -- do not allow to delete a user account, if it has active borrows
  borrow_from DATE NOT NULL,
  borrow_to DATE NOT NULL
);

CREATE TABLE borrow.copies_users_history (
  id SERIAL PRIMARY KEY,
  copy_id INTEGER NOT NULL REFERENCES book.copies (id) ON UPDATE CASCADE ON DELETE CASCADE,
  user_id INTEGER NOT NULL REFERENCES identity.users (id) ON UPDATE CASCADE ON DELETE CASCADE,
  borrow_start DATE NOT NULL,
  borrow_end DATE NOT NULL
);

CREATE TABLE borrow.copies_users_reserved (
  id SERIAL PRIMARY KEY,
  copy_id INTEGER NOT NULL REFERENCES book.copies (id) ON UPDATE CASCADE ON DELETE CASCADE,
  user_id INTEGER NOT NULL REFERENCES identity.users (id) ON UPDATE CASCADE ON DELETE CASCADE,
  duration INTERVAL NOT NULL
);
