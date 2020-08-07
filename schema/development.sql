--
-- DATABASE CODE LIBRARY
--

CREATE DATABASE code_library_development;
\c code_library_development

CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  sub VARCHAR(255) NOT NULL UNIQUE,
  email VARCHAR(50) NOT NULL,
  given_name VARCHAR(50) NOT NULL,
  family_name VARCHAR(50) NOT NULL,
  picture VARCHAR(200),
  oauth_access_token VARCHAR(256) NOT NULL,
  oauth_access_token_valid TIMESTAMP NOT NULL,
  oauth_refresh_token VARCHAR(256) NOT NULL,
  active BOOLEAN NOT NULL
);

CREATE TABLE roles (
  id SERIAL PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  access_manage_books BOOLEAN NOT NULL,
  access_manage_roles BOOLEAN NOT NULL
);

CREATE TABLE users_roles (
  id SERIAL PRIMARY KEY,
  user_id INTEGER NOT NULL REFERENCES users (id) ON UPDATE CASCADE ON DELETE CASCADE UNIQUE,
  role_id INTEGER NOT NULL REFERENCES roles (id) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE tags (
  id SERIAL PRIMARY KEY,
  name VARCHAR(50) NOT NULL
);

CREATE TABLE categories (
  id SERIAL PRIMARY KEY,
  name VARCHAR(10) NOT NULL
);

CREATE TABLE persons (
  id SERIAL PRIMARY KEY,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  date_of_birth DATE,
  isni VARCHAR(20),
  orcid VARCHAR(20),
  oclc VARCHAR(20)
);

CREATE TABLE publishers (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL
);

CREATE TABLE series (
  id SERIAL PRIMARY KEY,
  publisher_id INTEGER NOT NULL REFERENCES publishers (id) ON UPDATE CASCADE ON DELETE RESTRICT,
  name VARCHAR(100)
);

CREATE TABLE languages (
  id SERIAL PRIMARY KEY,
  iso_code VARCHAR(7) NOT NULL,
  name VARCHAR(200) NOT NULL
);

CREATE TABLE physical_sizes (
  id SERIAL PRIMARY KEY,
  name VARCHAR(50) NOT NULL
);

CREATE TABLE subject_areas (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL
);

CREATE TABLE books (
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
  publisher_id INTEGER NOT NULL REFERENCES publishers (id) ON UPDATE CASCADE ON DELETE RESTRICT,
  category_id INTEGER NOT NULL REFERENCES categories (id) ON UPDATE CASCADE ON DELETE RESTRICT,
  series_id INTEGER REFERENCES series (id) ON UPDATE CASCADE ON DELETE RESTRICT,
  language_id INTEGER NOT NULL REFERENCES languages (id) ON UPDATE CASCADE ON DELETE RESTRICT,
  physical_size_id INTEGER NOT NULL REFERENCES physical_sizes (id) ON UPDATE CASCADE ON DELETE RESTRICT
);

CREATE TABLE books_subject_areas (
  id SERIAL PRIMARY KEY,
  book_id INTEGER NOT NULL REFERENCES books (id) ON UPDATE CASCADE ON DELETE CASCADE,
  subject_area_id INTEGER NOT NULL REFERENCES subject_areas (id) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE books_tags (
  id SERIAL PRIMARY KEY,
  book_id INTEGER NOT NULL REFERENCES books (id) ON UPDATE CASCADE ON DELETE CASCADE,
  tag_id INTEGER NOT NULL REFERENCES tags (id) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE statuses (
  id SERIAL PRIMARY KEY,
  name VARCHAR(50) NOT NULL UNIQUE,
  available BOOLEAN NOT NULL,
  bookable BOOLEAN NOT NULL
);

CREATE TABLE copies (
  id SERIAL PRIMARY KEY,
  book_id INTEGER NOT NULL REFERENCES books (id) ON UPDATE CASCADE ON DELETE RESTRICT,
  status_id INTEGER NOT NULL REFERENCES statuses (id) ON UPDATE CASCADE ON DELETE RESTRICT,
  code_identifier_copy_id INTEGER,
  date_added DATE NOT NULL DEFAULT CURRENT_DATE
);

CREATE TABLE books_authors (
  id SERIAL PRIMARY KEY,
  book_id INTEGER NOT NULL REFERENCES books (id) ON UPDATE CASCADE ON DELETE RESTRICT,
  person_id INTEGER NOT NULL REFERENCES persons (id) ON UPDATE CASCADE ON DELETE RESTRICT
);

CREATE TABLE books_editors (
  id SERIAL PRIMARY KEY,
  book_id INTEGER NOT NULL REFERENCES books (id) ON UPDATE CASCADE ON DELETE RESTRICT,
  person_id INTEGER NOT NULL REFERENCES persons (id) ON UPDATE CASCADE ON DELETE RESTRICT
);

CREATE FUNCTION copies_book_id_create_seq() RETURNS trigger AS
  $$
  BEGIN
    IF EXISTS (SELECT * FROM copies WHERE book_id = NEW.book_id) THEN
      NEW.code_identifier_copy_id := nextval(format('copies_code_identifier_%s_seq', NEW.book_id));
      return NEW;
    ELSE
      EXECUTE format('CREATE SEQUENCE copies_code_identifier_%s_seq', NEW.book_id);
      NEW.code_identifier_copy_id := nextval(format('copies_code_identifier_%s_seq', NEW.book_id));
      return NEW;
    END IF;
  END
  $$ LANGUAGE plpgsql;

CREATE TRIGGER copies_book_id_create_seq BEFORE INSERT ON copies FOR EACH ROW EXECUTE PROCEDURE copies_book_id_create_seq();

CREATE FUNCTION copies_book_id_delete_seq() RETURNS trigger AS
  $$
  BEGIN
    IF (SELECT COUNT(*) FROM copies WHERE book_id = OLD.book_id) = 0 THEN
      EXECUTE format('DROP SEQUENCE copies_code_identifier_%s_seq', OLD.book_id);
    END IF;
    RETURN OLD;
  END
  $$ LANGUAGE plpgsql;

CREATE TRIGGER copies_book_id_delete_seq AFTER DELETE ON copies FOR EACH ROW EXECUTE PROCEDURE copies_book_id_delete_seq();


CREATE TABLE copies_users_active (
  id SERIAL PRIMARY KEY,
  copy_id INTEGER NOT NULL REFERENCES copies (id) ON UPDATE CASCADE ON DELETE RESTRICT UNIQUE, -- do not allow to delete a book copy, if it is lend to a user
  user_id INTEGER NOT NULL REFERENCES users (id) ON UPDATE CASCADE ON DELETE RESTRICT, -- do not allow to delete a user account, if it has active borrows
  borrow_from DATE NOT NULL,
  borrow_to DATE NOT NULL
);

CREATE TABLE copies_users_history (
  id SERIAL PRIMARY KEY,
  copy_id INTEGER NOT NULL REFERENCES copies (id) ON UPDATE CASCADE ON DELETE CASCADE,
  user_id INTEGER NOT NULL REFERENCES users (id) ON UPDATE CASCADE ON DELETE CASCADE,
  borrow_start DATE NOT NULL,
  borrow_end DATE NOT NULL
);

CREATE TABLE copies_users_reserved (
  id SERIAL PRIMARY KEY,
  copy_id INTEGER NOT NULL REFERENCES copies (id) ON UPDATE CASCADE ON DELETE CASCADE,
  user_id INTEGER NOT NULL REFERENCES users (id) ON UPDATE CASCADE ON DELETE CASCADE,
  duration INTERVAL NOT NULL
);
