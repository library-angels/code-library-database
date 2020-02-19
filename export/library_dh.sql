INSERT INTO book.publishers (name) SELECT 'Vintage Books' WHERE NOT EXISTS (SELECT * FROM book.publishers WHERE name = 'Vintage Books');
INSERT INTO book.subject_areas (name) SELECT 'Health Care' WHERE NOT EXISTS (SELECT * FROM book.subject_areas WHERE name = 'Health Care');
INSERT INTO book.persons (first_name, last_name) SELECT 'David', 'Goldhill' WHERE NOT EXISTS (SELECT * FROM book.persons WHERE first_name = 'David' AND last_name = 'Goldhill');
INSERT INTO book.books       (isbn_13, issn, title, subtitle, description, cover, edition, release_year, pages, code_identifier, publisher_id, designation_id, series_id, language_id, physical_size_id)       VALUES       ('9780345802736', NULL, 'Catastrophic Care', 'Why everything we think we know about health care is wrong', NULL, NULL, NULL, 2013, NULL, 'DH01', (SELECT id FROM book.publishers WHERE name = 'Vintage Books'), (SELECT id FROM book.designations WHERE name = 'STS'), NULL, (SELECT id FROM book.languages WHERE iso_code = 'eng'), (SELECT id FROM book.physical_sizes WHERE name = 'normal'));
INSERT INTO book.copies (book_id, status_id) VALUES ((SELECT id FROM book.books WHERE title = 'Catastrophic Care' AND subtitle = 'Why everything we think we know about health care is wrong'), 1);
INSERT INTO book.books_authors (book_id, person_id) VALUES ((SELECT id FROM book.books WHERE title = 'Catastrophic Care' AND subtitle = 'Why everything we think we know about health care is wrong'), (SELECT id FROM book.persons WHERE first_name = 'David' AND last_name = 'Goldhill'));
INSERT INTO book.books_subject_areas (book_id, subject_area_id) VALUES ((SELECT id FROM book.books WHERE title = 'Catastrophic Care' AND subtitle = 'Why everything we think we know about health care is wrong'), (SELECT id FROM book.subject_areas WHERE name = 'Health Care'));
INSERT INTO book.publishers (name) SELECT 'Profile Books' WHERE NOT EXISTS (SELECT * FROM book.publishers WHERE name = 'Profile Books');
INSERT INTO book.subject_areas (name) SELECT 'Mortality' WHERE NOT EXISTS (SELECT * FROM book.subject_areas WHERE name = 'Mortality');
INSERT INTO book.persons (first_name, last_name) SELECT 'Atul', 'Gawande' WHERE NOT EXISTS (SELECT * FROM book.persons WHERE first_name = 'Atul' AND last_name = 'Gawande');
INSERT INTO book.books       (isbn_13, issn, title, subtitle, description, cover, edition, release_year, pages, code_identifier, publisher_id, designation_id, series_id, language_id, physical_size_id)       VALUES       ('9781846685828', NULL, 'Being Mortal', 'Illness, Medicine and what matters in the end', NULL, NULL, NULL, 2014, NULL, 'DH02', (SELECT id FROM book.publishers WHERE name = 'Profile Books'), (SELECT id FROM book.designations WHERE name = 'STS'), NULL, (SELECT id FROM book.languages WHERE iso_code = 'eng'), (SELECT id FROM book.physical_sizes WHERE name = 'normal'));
INSERT INTO book.copies (book_id, status_id) VALUES ((SELECT id FROM book.books WHERE title = 'Being Mortal' AND subtitle = 'Illness, Medicine and what matters in the end'), 1);
INSERT INTO book.books_authors (book_id, person_id) VALUES ((SELECT id FROM book.books WHERE title = 'Being Mortal' AND subtitle = 'Illness, Medicine and what matters in the end'), (SELECT id FROM book.persons WHERE first_name = 'Atul' AND last_name = 'Gawande'));
INSERT INTO book.books_subject_areas (book_id, subject_area_id) VALUES ((SELECT id FROM book.books WHERE title = 'Being Mortal' AND subtitle = 'Illness, Medicine and what matters in the end'), (SELECT id FROM book.subject_areas WHERE name = 'Mortality'));
INSERT INTO book.publishers (name) SELECT 'Transworld Publishers' WHERE NOT EXISTS (SELECT * FROM book.publishers WHERE name = 'Transworld Publishers');
INSERT INTO book.subject_areas (name) SELECT 'Quantum Biology' WHERE NOT EXISTS (SELECT * FROM book.subject_areas WHERE name = 'Quantum Biology');
INSERT INTO book.persons (first_name, last_name) SELECT 'Jim', 'Al-Khalili' WHERE NOT EXISTS (SELECT * FROM book.persons WHERE first_name = 'Jim' AND last_name = 'Al-Khalili');
INSERT INTO book.persons (first_name, last_name) SELECT 'Johnjoe', 'McFadden' WHERE NOT EXISTS (SELECT * FROM book.persons WHERE first_name = 'Johnjoe' AND last_name = 'McFadden');
INSERT INTO book.books       (isbn_13, issn, title, subtitle, description, cover, edition, release_year, pages, code_identifier, publisher_id, designation_id, series_id, language_id, physical_size_id)       VALUES       ('9780552778077', NULL, 'Life on the Edge', 'The Coming of Age of Quantum Biology', NULL, NULL, NULL, 2014, NULL, 'DH03', (SELECT id FROM book.publishers WHERE name = 'Transworld Publishers'), (SELECT id FROM book.designations WHERE name = 'STS'), NULL, (SELECT id FROM book.languages WHERE iso_code = 'eng'), (SELECT id FROM book.physical_sizes WHERE name = 'normal'));
INSERT INTO book.copies (book_id, status_id) VALUES ((SELECT id FROM book.books WHERE title = 'Life on the Edge' AND subtitle = 'The Coming of Age of Quantum Biology'), 1);
INSERT INTO book.books_authors (book_id, person_id) VALUES ((SELECT id FROM book.books WHERE title = 'Life on the Edge' AND subtitle = 'The Coming of Age of Quantum Biology'), (SELECT id FROM book.persons WHERE first_name = 'Jim' AND last_name = 'Al-Khalili'));
INSERT INTO book.books_authors (book_id, person_id) VALUES ((SELECT id FROM book.books WHERE title = 'Life on the Edge' AND subtitle = 'The Coming of Age of Quantum Biology'), (SELECT id FROM book.persons WHERE first_name = 'Johnjoe' AND last_name = 'McFadden'));
INSERT INTO book.books_subject_areas (book_id, subject_area_id) VALUES ((SELECT id FROM book.books WHERE title = 'Life on the Edge' AND subtitle = 'The Coming of Age of Quantum Biology'), (SELECT id FROM book.subject_areas WHERE name = 'Quantum Biology'));
INSERT INTO book.publishers (name) SELECT 'Basic Books' WHERE NOT EXISTS (SELECT * FROM book.publishers WHERE name = 'Basic Books');
INSERT INTO book.subject_areas (name) SELECT 'Medicine in the Future' WHERE NOT EXISTS (SELECT * FROM book.subject_areas WHERE name = 'Medicine in the Future');
INSERT INTO book.persons (first_name, last_name) SELECT 'Eric', 'Topol' WHERE NOT EXISTS (SELECT * FROM book.persons WHERE first_name = 'Eric' AND last_name = 'Topol');
INSERT INTO book.books       (isbn_13, issn, title, subtitle, description, cover, edition, release_year, pages, code_identifier, publisher_id, designation_id, series_id, language_id, physical_size_id)       VALUES       ('9780465040025', NULL, 'The Patient Will See You Now', 'The future of medicine is in your hands', NULL, NULL, NULL, 2015, NULL, 'DH04', (SELECT id FROM book.publishers WHERE name = 'Basic Books'), (SELECT id FROM book.designations WHERE name = 'STS'), NULL, (SELECT id FROM book.languages WHERE iso_code = 'eng'), (SELECT id FROM book.physical_sizes WHERE name = 'normal'));
INSERT INTO book.copies (book_id, status_id) VALUES ((SELECT id FROM book.books WHERE title = 'The Patient Will See You Now' AND subtitle = 'The future of medicine is in your hands'), 1);
INSERT INTO book.books_authors (book_id, person_id) VALUES ((SELECT id FROM book.books WHERE title = 'The Patient Will See You Now' AND subtitle = 'The future of medicine is in your hands'), (SELECT id FROM book.persons WHERE first_name = 'Eric' AND last_name = 'Topol'));
INSERT INTO book.books_subject_areas (book_id, subject_area_id) VALUES ((SELECT id FROM book.books WHERE title = 'The Patient Will See You Now' AND subtitle = 'The future of medicine is in your hands'), (SELECT id FROM book.subject_areas WHERE name = 'Medicine in the Future'));
INSERT INTO book.publishers (name) SELECT 'Picador' WHERE NOT EXISTS (SELECT * FROM book.publishers WHERE name = 'Picador');
INSERT INTO book.subject_areas (name) SELECT 'Medicine' WHERE NOT EXISTS (SELECT * FROM book.subject_areas WHERE name = 'Medicine');
INSERT INTO book.persons (first_name, last_name) SELECT 'Atul', 'Gawande' WHERE NOT EXISTS (SELECT * FROM book.persons WHERE first_name = 'Atul' AND last_name = 'Gawande');
INSERT INTO book.books       (isbn_13, issn, title, subtitle, description, cover, edition, release_year, pages, code_identifier, publisher_id, designation_id, series_id, language_id, physical_size_id)       VALUES       ('9780312427658', NULL, 'Better', 'A Surgeon''s Notes on Performance', NULL, NULL, NULL, 2007, NULL, 'DH05', (SELECT id FROM book.publishers WHERE name = 'Picador'), (SELECT id FROM book.designations WHERE name = 'STS'), NULL, (SELECT id FROM book.languages WHERE iso_code = 'eng'), (SELECT id FROM book.physical_sizes WHERE name = 'normal'));
INSERT INTO book.copies (book_id, status_id) VALUES ((SELECT id FROM book.books WHERE title = 'Better' AND subtitle = 'A Surgeon''s Notes on Performance'), 1);
INSERT INTO book.books_authors (book_id, person_id) VALUES ((SELECT id FROM book.books WHERE title = 'Better' AND subtitle = 'A Surgeon''s Notes on Performance'), (SELECT id FROM book.persons WHERE first_name = 'Atul' AND last_name = 'Gawande'));
INSERT INTO book.books_subject_areas (book_id, subject_area_id) VALUES ((SELECT id FROM book.books WHERE title = 'Better' AND subtitle = 'A Surgeon''s Notes on Performance'), (SELECT id FROM book.subject_areas WHERE name = 'Medicine'));
INSERT INTO book.publishers (name) SELECT 'Norton' WHERE NOT EXISTS (SELECT * FROM book.publishers WHERE name = 'Norton');
INSERT INTO book.subject_areas (name) SELECT 'Information Technology' WHERE NOT EXISTS (SELECT * FROM book.subject_areas WHERE name = 'Information Technology');
INSERT INTO book.persons (first_name, last_name) SELECT 'Andrew', 'McAfee' WHERE NOT EXISTS (SELECT * FROM book.persons WHERE first_name = 'Andrew' AND last_name = 'McAfee');
INSERT INTO book.persons (first_name, last_name) SELECT 'Erik', 'Brynjolfsson' WHERE NOT EXISTS (SELECT * FROM book.persons WHERE first_name = 'Erik' AND last_name = 'Brynjolfsson');
INSERT INTO book.books       (isbn_13, issn, title, subtitle, description, cover, edition, release_year, pages, code_identifier, publisher_id, designation_id, series_id, language_id, physical_size_id)       VALUES       ('9780393356069', NULL, 'Machine Platform Crowd', 'Harnessing our Digital Future', NULL, NULL, NULL, 2017, NULL, 'DH06', (SELECT id FROM book.publishers WHERE name = 'Norton'), (SELECT id FROM book.designations WHERE name = 'STS'), NULL, (SELECT id FROM book.languages WHERE iso_code = 'eng'), (SELECT id FROM book.physical_sizes WHERE name = 'normal'));
INSERT INTO book.copies (book_id, status_id) VALUES ((SELECT id FROM book.books WHERE title = 'Machine Platform Crowd' AND subtitle = 'Harnessing our Digital Future'), 1);
INSERT INTO book.books_authors (book_id, person_id) VALUES ((SELECT id FROM book.books WHERE title = 'Machine Platform Crowd' AND subtitle = 'Harnessing our Digital Future'), (SELECT id FROM book.persons WHERE first_name = 'Andrew' AND last_name = 'McAfee'));
INSERT INTO book.books_authors (book_id, person_id) VALUES ((SELECT id FROM book.books WHERE title = 'Machine Platform Crowd' AND subtitle = 'Harnessing our Digital Future'), (SELECT id FROM book.persons WHERE first_name = 'Erik' AND last_name = 'Brynjolfsson'));
INSERT INTO book.books_subject_areas (book_id, subject_area_id) VALUES ((SELECT id FROM book.books WHERE title = 'Machine Platform Crowd' AND subtitle = 'Harnessing our Digital Future'), (SELECT id FROM book.subject_areas WHERE name = 'Information Technology'));
INSERT INTO book.publishers (name) SELECT 'Picador' WHERE NOT EXISTS (SELECT * FROM book.publishers WHERE name = 'Picador');
INSERT INTO book.subject_areas (name) SELECT 'Checklists' WHERE NOT EXISTS (SELECT * FROM book.subject_areas WHERE name = 'Checklists');
INSERT INTO book.persons (first_name, last_name) SELECT 'Atul', 'Gawande' WHERE NOT EXISTS (SELECT * FROM book.persons WHERE first_name = 'Atul' AND last_name = 'Gawande');
INSERT INTO book.books       (isbn_13, issn, title, subtitle, description, cover, edition, release_year, pages, code_identifier, publisher_id, designation_id, series_id, language_id, physical_size_id)       VALUES       ('9780312430009', NULL, 'The Checklist Manifestio', 'How to get things right', NULL, NULL, NULL, 2009, NULL, 'DH07', (SELECT id FROM book.publishers WHERE name = 'Picador'), (SELECT id FROM book.designations WHERE name = 'STS'), NULL, (SELECT id FROM book.languages WHERE iso_code = 'eng'), (SELECT id FROM book.physical_sizes WHERE name = 'normal'));
INSERT INTO book.copies (book_id, status_id) VALUES ((SELECT id FROM book.books WHERE title = 'The Checklist Manifestio' AND subtitle = 'How to get things right'), 1);
INSERT INTO book.books_authors (book_id, person_id) VALUES ((SELECT id FROM book.books WHERE title = 'The Checklist Manifestio' AND subtitle = 'How to get things right'), (SELECT id FROM book.persons WHERE first_name = 'Atul' AND last_name = 'Gawande'));
INSERT INTO book.books_subject_areas (book_id, subject_area_id) VALUES ((SELECT id FROM book.books WHERE title = 'The Checklist Manifestio' AND subtitle = 'How to get things right'), (SELECT id FROM book.subject_areas WHERE name = 'Checklists'));
INSERT INTO book.publishers (name) SELECT 'Bloomsbury' WHERE NOT EXISTS (SELECT * FROM book.publishers WHERE name = 'Bloomsbury');
INSERT INTO book.subject_areas (name) SELECT 'Medicine' WHERE NOT EXISTS (SELECT * FROM book.subject_areas WHERE name = 'Medicine');
INSERT INTO book.persons (first_name, last_name) SELECT 'Shannon', 'Brownlee' WHERE NOT EXISTS (SELECT * FROM book.persons WHERE first_name = 'Shannon' AND last_name = 'Brownlee');
INSERT INTO book.books       (isbn_13, issn, title, subtitle, description, cover, edition, release_year, pages, code_identifier, publisher_id, designation_id, series_id, language_id, physical_size_id)       VALUES       ('9781582345796', NULL, 'Overtreated', 'Why too much medicine is making us sicker and poorer', NULL, NULL, NULL, 2007, NULL, 'DH08', (SELECT id FROM book.publishers WHERE name = 'Bloomsbury'), (SELECT id FROM book.designations WHERE name = 'STS'), NULL, (SELECT id FROM book.languages WHERE iso_code = 'eng'), (SELECT id FROM book.physical_sizes WHERE name = 'normal'));
INSERT INTO book.copies (book_id, status_id) VALUES ((SELECT id FROM book.books WHERE title = 'Overtreated' AND subtitle = 'Why too much medicine is making us sicker and poorer'), 1);
INSERT INTO book.books_authors (book_id, person_id) VALUES ((SELECT id FROM book.books WHERE title = 'Overtreated' AND subtitle = 'Why too much medicine is making us sicker and poorer'), (SELECT id FROM book.persons WHERE first_name = 'Shannon' AND last_name = 'Brownlee'));
INSERT INTO book.books_subject_areas (book_id, subject_area_id) VALUES ((SELECT id FROM book.books WHERE title = 'Overtreated' AND subtitle = 'Why too much medicine is making us sicker and poorer'), (SELECT id FROM book.subject_areas WHERE name = 'Medicine'));
INSERT INTO book.publishers (name) SELECT 'McGraw-Hill' WHERE NOT EXISTS (SELECT * FROM book.publishers WHERE name = 'McGraw-Hill');
INSERT INTO book.subject_areas (name) SELECT 'Health Care' WHERE NOT EXISTS (SELECT * FROM book.subject_areas WHERE name = 'Health Care');
INSERT INTO book.persons (first_name, last_name) SELECT 'Clayton M.', 'Christensen' WHERE NOT EXISTS (SELECT * FROM book.persons WHERE first_name = 'Clayton M.' AND last_name = 'Christensen');
INSERT INTO book.books       (isbn_13, issn, title, subtitle, description, cover, edition, release_year, pages, code_identifier, publisher_id, designation_id, series_id, language_id, physical_size_id)       VALUES       ('9781259860867', NULL, 'The Innovator''s Prescription', 'A Disruptive Solution for Health Care', NULL, NULL, NULL, 2017, NULL, 'DH09', (SELECT id FROM book.publishers WHERE name = 'McGraw-Hill'), (SELECT id FROM book.designations WHERE name = 'STS'), NULL, (SELECT id FROM book.languages WHERE iso_code = 'eng'), (SELECT id FROM book.physical_sizes WHERE name = 'normal'));
INSERT INTO book.copies (book_id, status_id) VALUES ((SELECT id FROM book.books WHERE title = 'The Innovator''s Prescription' AND subtitle = 'A Disruptive Solution for Health Care'), 1);
INSERT INTO book.books_authors (book_id, person_id) VALUES ((SELECT id FROM book.books WHERE title = 'The Innovator''s Prescription' AND subtitle = 'A Disruptive Solution for Health Care'), (SELECT id FROM book.persons WHERE first_name = 'Clayton M.' AND last_name = 'Christensen'));
INSERT INTO book.books_subject_areas (book_id, subject_area_id) VALUES ((SELECT id FROM book.books WHERE title = 'The Innovator''s Prescription' AND subtitle = 'A Disruptive Solution for Health Care'), (SELECT id FROM book.subject_areas WHERE name = 'Health Care'));
INSERT INTO book.publishers (name) SELECT 'O''Reilly Media' WHERE NOT EXISTS (SELECT * FROM book.publishers WHERE name = 'O''Reilly Media');
INSERT INTO book.subject_areas (name) SELECT 'Health Care' WHERE NOT EXISTS (SELECT * FROM book.subject_areas WHERE name = 'Health Care');
INSERT INTO book.persons (first_name, last_name) SELECT 'Fred', 'Trotter' WHERE NOT EXISTS (SELECT * FROM book.persons WHERE first_name = 'Fred' AND last_name = 'Trotter');
INSERT INTO book.persons (first_name, last_name) SELECT 'David', 'Uhlman' WHERE NOT EXISTS (SELECT * FROM book.persons WHERE first_name = 'David' AND last_name = 'Uhlman');
INSERT INTO book.books       (isbn_13, issn, title, subtitle, description, cover, edition, release_year, pages, code_identifier, publisher_id, designation_id, series_id, language_id, physical_size_id)       VALUES       ('9781449305024', NULL, 'Hacking Healthcare', 'A Guide to Standards, Workflows, and Meaningful Use', NULL, NULL, NULL, 2013, NULL, 'DH10', (SELECT id FROM book.publishers WHERE name = 'O''Reilly Media'), (SELECT id FROM book.designations WHERE name = 'STS'), NULL, (SELECT id FROM book.languages WHERE iso_code = 'eng'), (SELECT id FROM book.physical_sizes WHERE name = 'normal'));
INSERT INTO book.copies (book_id, status_id) VALUES ((SELECT id FROM book.books WHERE title = 'Hacking Healthcare' AND subtitle = 'A Guide to Standards, Workflows, and Meaningful Use'), 1);
INSERT INTO book.books_authors (book_id, person_id) VALUES ((SELECT id FROM book.books WHERE title = 'Hacking Healthcare' AND subtitle = 'A Guide to Standards, Workflows, and Meaningful Use'), (SELECT id FROM book.persons WHERE first_name = 'Fred' AND last_name = 'Trotter'));
INSERT INTO book.books_authors (book_id, person_id) VALUES ((SELECT id FROM book.books WHERE title = 'Hacking Healthcare' AND subtitle = 'A Guide to Standards, Workflows, and Meaningful Use'), (SELECT id FROM book.persons WHERE first_name = 'David' AND last_name = 'Uhlman'));
INSERT INTO book.books_subject_areas (book_id, subject_area_id) VALUES ((SELECT id FROM book.books WHERE title = 'Hacking Healthcare' AND subtitle = 'A Guide to Standards, Workflows, and Meaningful Use'), (SELECT id FROM book.subject_areas WHERE name = 'Health Care'));
INSERT INTO book.publishers (name) SELECT 'Springer' WHERE NOT EXISTS (SELECT * FROM book.publishers WHERE name = 'Springer');
INSERT INTO book.subject_areas (name) SELECT 'Health Care' WHERE NOT EXISTS (SELECT * FROM book.subject_areas WHERE name = 'Health Care');
INSERT INTO book.persons (first_name, last_name) SELECT 'Michael E.', 'Porter' WHERE NOT EXISTS (SELECT * FROM book.persons WHERE first_name = 'Michael E.' AND last_name = 'Porter');
INSERT INTO book.persons (first_name, last_name) SELECT 'Clemens', 'Guth' WHERE NOT EXISTS (SELECT * FROM book.persons WHERE first_name = 'Clemens' AND last_name = 'Guth');
INSERT INTO book.books       (isbn_13, issn, title, subtitle, description, cover, edition, release_year, pages, code_identifier, publisher_id, designation_id, series_id, language_id, physical_size_id)       VALUES       ('9783642108259', NULL, 'Redefining German Healthcare', 'Moving to a Value-Based System', NULL, NULL, NULL, 2012, NULL, 'DH11', (SELECT id FROM book.publishers WHERE name = 'Springer'), (SELECT id FROM book.designations WHERE name = 'STS'), NULL, (SELECT id FROM book.languages WHERE iso_code = 'eng'), (SELECT id FROM book.physical_sizes WHERE name = 'normal'));
INSERT INTO book.copies (book_id, status_id) VALUES ((SELECT id FROM book.books WHERE title = 'Redefining German Healthcare' AND subtitle = 'Moving to a Value-Based System'), 1);
INSERT INTO book.books_authors (book_id, person_id) VALUES ((SELECT id FROM book.books WHERE title = 'Redefining German Healthcare' AND subtitle = 'Moving to a Value-Based System'), (SELECT id FROM book.persons WHERE first_name = 'Michael E.' AND last_name = 'Porter'));
INSERT INTO book.books_authors (book_id, person_id) VALUES ((SELECT id FROM book.books WHERE title = 'Redefining German Healthcare' AND subtitle = 'Moving to a Value-Based System'), (SELECT id FROM book.persons WHERE first_name = 'Clemens' AND last_name = 'Guth'));
INSERT INTO book.books_subject_areas (book_id, subject_area_id) VALUES ((SELECT id FROM book.books WHERE title = 'Redefining German Healthcare' AND subtitle = 'Moving to a Value-Based System'), (SELECT id FROM book.subject_areas WHERE name = 'Health Care'));
INSERT INTO book.publishers (name) SELECT 'McGraw-Hill' WHERE NOT EXISTS (SELECT * FROM book.publishers WHERE name = 'McGraw-Hill');
INSERT INTO book.subject_areas (name) SELECT 'Medicine in the Future' WHERE NOT EXISTS (SELECT * FROM book.subject_areas WHERE name = 'Medicine in the Future');
INSERT INTO book.persons (first_name, last_name) SELECT 'Robert', 'Wachter' WHERE NOT EXISTS (SELECT * FROM book.persons WHERE first_name = 'Robert' AND last_name = 'Wachter');
INSERT INTO book.books       (isbn_13, issn, title, subtitle, description, cover, edition, release_year, pages, code_identifier, publisher_id, designation_id, series_id, language_id, physical_size_id)       VALUES       ('9781260019605', NULL, 'The Digital Doctor', 'Hope, Hype and Harm at the Dawn of Medicine''s Computer Age', NULL, NULL, NULL, 2017, NULL, 'DH12', (SELECT id FROM book.publishers WHERE name = 'McGraw-Hill'), (SELECT id FROM book.designations WHERE name = 'STS'), NULL, (SELECT id FROM book.languages WHERE iso_code = 'eng'), (SELECT id FROM book.physical_sizes WHERE name = 'normal'));
INSERT INTO book.copies (book_id, status_id) VALUES ((SELECT id FROM book.books WHERE title = 'The Digital Doctor' AND subtitle = 'Hope, Hype and Harm at the Dawn of Medicine''s Computer Age'), 1);
INSERT INTO book.books_authors (book_id, person_id) VALUES ((SELECT id FROM book.books WHERE title = 'The Digital Doctor' AND subtitle = 'Hope, Hype and Harm at the Dawn of Medicine''s Computer Age'), (SELECT id FROM book.persons WHERE first_name = 'Robert' AND last_name = 'Wachter'));
INSERT INTO book.books_subject_areas (book_id, subject_area_id) VALUES ((SELECT id FROM book.books WHERE title = 'The Digital Doctor' AND subtitle = 'Hope, Hype and Harm at the Dawn of Medicine''s Computer Age'), (SELECT id FROM book.subject_areas WHERE name = 'Medicine in the Future'));
INSERT INTO book.publishers (name) SELECT 'Penguin' WHERE NOT EXISTS (SELECT * FROM book.publishers WHERE name = 'Penguin');
INSERT INTO book.subject_areas (name) SELECT 'Health Care' WHERE NOT EXISTS (SELECT * FROM book.subject_areas WHERE name = 'Health Care');
INSERT INTO book.persons (first_name, last_name) SELECT 'Jonathan', 'Bush' WHERE NOT EXISTS (SELECT * FROM book.persons WHERE first_name = 'Jonathan' AND last_name = 'Bush');
INSERT INTO book.books       (isbn_13, issn, title, subtitle, description, cover, edition, release_year, pages, code_identifier, publisher_id, designation_id, series_id, language_id, physical_size_id)       VALUES       ('9781591846772', NULL, 'Where Does It Hurt?', 'An Entrepreneur''s Guide to Fixing Health Care', NULL, NULL, NULL, 2014, NULL, 'DH13', (SELECT id FROM book.publishers WHERE name = 'Penguin'), (SELECT id FROM book.designations WHERE name = 'STS'), NULL, (SELECT id FROM book.languages WHERE iso_code = 'eng'), (SELECT id FROM book.physical_sizes WHERE name = 'normal'));
INSERT INTO book.copies (book_id, status_id) VALUES ((SELECT id FROM book.books WHERE title = 'Where Does It Hurt?' AND subtitle = 'An Entrepreneur''s Guide to Fixing Health Care'), 1);
INSERT INTO book.books_authors (book_id, person_id) VALUES ((SELECT id FROM book.books WHERE title = 'Where Does It Hurt?' AND subtitle = 'An Entrepreneur''s Guide to Fixing Health Care'), (SELECT id FROM book.persons WHERE first_name = 'Jonathan' AND last_name = 'Bush'));
INSERT INTO book.books_subject_areas (book_id, subject_area_id) VALUES ((SELECT id FROM book.books WHERE title = 'Where Does It Hurt?' AND subtitle = 'An Entrepreneur''s Guide to Fixing Health Care'), (SELECT id FROM book.subject_areas WHERE name = 'Health Care'));
INSERT INTO book.publishers (name) SELECT 'Basic Books' WHERE NOT EXISTS (SELECT * FROM book.publishers WHERE name = 'Basic Books');
INSERT INTO book.subject_areas (name) SELECT 'Medicine' WHERE NOT EXISTS (SELECT * FROM book.subject_areas WHERE name = 'Medicine');
INSERT INTO book.subject_areas (name) SELECT 'Health Care' WHERE NOT EXISTS (SELECT * FROM book.subject_areas WHERE name = 'Health Care');
INSERT INTO book.persons (first_name, last_name) SELECT 'Eric', 'Topol' WHERE NOT EXISTS (SELECT * FROM book.persons WHERE first_name = 'Eric' AND last_name = 'Topol');
INSERT INTO book.books       (isbn_13, issn, title, subtitle, description, cover, edition, release_year, pages, code_identifier, publisher_id, designation_id, series_id, language_id, physical_size_id)       VALUES       ('9780465061839', NULL, 'The Creative Destruction of Medicine', 'How the Digital Revolution will create better Health Care', NULL, NULL, NULL, 2012, NULL, 'DH14', (SELECT id FROM book.publishers WHERE name = 'Basic Books'), (SELECT id FROM book.designations WHERE name = 'STS'), NULL, (SELECT id FROM book.languages WHERE iso_code = 'eng'), (SELECT id FROM book.physical_sizes WHERE name = 'normal'));
INSERT INTO book.copies (book_id, status_id) VALUES ((SELECT id FROM book.books WHERE title = 'The Creative Destruction of Medicine' AND subtitle = 'How the Digital Revolution will create better Health Care'), 1);
INSERT INTO book.books_authors (book_id, person_id) VALUES ((SELECT id FROM book.books WHERE title = 'The Creative Destruction of Medicine' AND subtitle = 'How the Digital Revolution will create better Health Care'), (SELECT id FROM book.persons WHERE first_name = 'Eric' AND last_name = 'Topol'));
INSERT INTO book.books_subject_areas (book_id, subject_area_id) VALUES ((SELECT id FROM book.books WHERE title = 'The Creative Destruction of Medicine' AND subtitle = 'How the Digital Revolution will create better Health Care'), (SELECT id FROM book.subject_areas WHERE name = 'Medicine'));
INSERT INTO book.books_subject_areas (book_id, subject_area_id) VALUES ((SELECT id FROM book.books WHERE title = 'The Creative Destruction of Medicine' AND subtitle = 'How the Digital Revolution will create better Health Care'), (SELECT id FROM book.subject_areas WHERE name = 'Health Care'));
INSERT INTO book.publishers (name) SELECT 'Springer' WHERE NOT EXISTS (SELECT * FROM book.publishers WHERE name = 'Springer');
INSERT INTO book.subject_areas (name) SELECT 'Digital Health' WHERE NOT EXISTS (SELECT * FROM book.subject_areas WHERE name = 'Digital Health');
INSERT INTO book.persons (first_name, last_name) SELECT 'Samuel A.', 'Fricker' WHERE NOT EXISTS (SELECT * FROM book.persons WHERE first_name = 'Samuel A.' AND last_name = 'Fricker');
INSERT INTO book.persons (first_name, last_name) SELECT 'Christoph', 'Thümmler' WHERE NOT EXISTS (SELECT * FROM book.persons WHERE first_name = 'Christoph' AND last_name = 'Thümmler');
INSERT INTO book.persons (first_name, last_name) SELECT 'Anastasius', 'Gavras' WHERE NOT EXISTS (SELECT * FROM book.persons WHERE first_name = 'Anastasius' AND last_name = 'Gavras');
INSERT INTO book.books       (isbn_13, issn, title, subtitle, description, cover, edition, release_year, pages, code_identifier, publisher_id, designation_id, series_id, language_id, physical_size_id)       VALUES       ('9783319379531', NULL, 'Requirements Engineering for Digital Health', '', NULL, NULL, NULL, 2015, NULL, 'DH15', (SELECT id FROM book.publishers WHERE name = 'Springer'), (SELECT id FROM book.designations WHERE name = 'STS'), NULL, (SELECT id FROM book.languages WHERE iso_code = 'eng'), (SELECT id FROM book.physical_sizes WHERE name = 'normal'));
INSERT INTO book.copies (book_id, status_id) VALUES ((SELECT id FROM book.books WHERE title = 'Requirements Engineering for Digital Health' AND subtitle = ''), 1);
INSERT INTO book.books_authors (book_id, person_id) VALUES ((SELECT id FROM book.books WHERE title = 'Requirements Engineering for Digital Health' AND subtitle = ''), (SELECT id FROM book.persons WHERE first_name = 'Samuel A.' AND last_name = 'Fricker'));
INSERT INTO book.books_authors (book_id, person_id) VALUES ((SELECT id FROM book.books WHERE title = 'Requirements Engineering for Digital Health' AND subtitle = ''), (SELECT id FROM book.persons WHERE first_name = 'Christoph' AND last_name = 'Thümmler'));
INSERT INTO book.books_authors (book_id, person_id) VALUES ((SELECT id FROM book.books WHERE title = 'Requirements Engineering for Digital Health' AND subtitle = ''), (SELECT id FROM book.persons WHERE first_name = 'Anastasius' AND last_name = 'Gavras'));
INSERT INTO book.books_subject_areas (book_id, subject_area_id) VALUES ((SELECT id FROM book.books WHERE title = 'Requirements Engineering for Digital Health' AND subtitle = ''), (SELECT id FROM book.subject_areas WHERE name = 'Digital Health'));
INSERT INTO book.publishers (name) SELECT 'HarperCollins' WHERE NOT EXISTS (SELECT * FROM book.publishers WHERE name = 'HarperCollins');
INSERT INTO book.subject_areas (name) SELECT 'Health Care' WHERE NOT EXISTS (SELECT * FROM book.subject_areas WHERE name = 'Health Care');
INSERT INTO book.persons (first_name, last_name) SELECT 'Jeremy N.', 'Smith' WHERE NOT EXISTS (SELECT * FROM book.persons WHERE first_name = 'Jeremy N.' AND last_name = 'Smith');
INSERT INTO book.books       (isbn_13, issn, title, subtitle, description, cover, edition, release_year, pages, code_identifier, publisher_id, designation_id, series_id, language_id, physical_size_id)       VALUES       ('9780062237507', NULL, 'Epic Measures', 'One Doctor. Seven Billion Patients', NULL, NULL, NULL, 2015, NULL, 'DH16', (SELECT id FROM book.publishers WHERE name = 'HarperCollins'), (SELECT id FROM book.designations WHERE name = 'STS'), NULL, (SELECT id FROM book.languages WHERE iso_code = 'eng'), (SELECT id FROM book.physical_sizes WHERE name = 'normal'));
INSERT INTO book.copies (book_id, status_id) VALUES ((SELECT id FROM book.books WHERE title = 'Epic Measures' AND subtitle = 'One Doctor. Seven Billion Patients'), 1);
INSERT INTO book.books_authors (book_id, person_id) VALUES ((SELECT id FROM book.books WHERE title = 'Epic Measures' AND subtitle = 'One Doctor. Seven Billion Patients'), (SELECT id FROM book.persons WHERE first_name = 'Jeremy N.' AND last_name = 'Smith'));
INSERT INTO book.books_subject_areas (book_id, subject_area_id) VALUES ((SELECT id FROM book.books WHERE title = 'Epic Measures' AND subtitle = 'One Doctor. Seven Billion Patients'), (SELECT id FROM book.subject_areas WHERE name = 'Health Care'));
INSERT INTO book.publishers (name) SELECT 'Madizinisch Wissenschaftliche Verlagsgesellschaft' WHERE NOT EXISTS (SELECT * FROM book.publishers WHERE name = 'Madizinisch Wissenschaftliche Verlagsgesellschaft');
INSERT INTO book.subject_areas (name) SELECT 'Medicine' WHERE NOT EXISTS (SELECT * FROM book.subject_areas WHERE name = 'Medicine');
INSERT INTO book.persons (first_name, last_name) SELECT 'Hartwig', 'Huland' WHERE NOT EXISTS (SELECT * FROM book.persons WHERE first_name = 'Hartwig' AND last_name = 'Huland');
INSERT INTO book.persons (first_name, last_name) SELECT 'Markus', 'Graefen' WHERE NOT EXISTS (SELECT * FROM book.persons WHERE first_name = 'Markus' AND last_name = 'Graefen');
INSERT INTO book.persons (first_name, last_name) SELECT 'Jens Deerberg-Wittram', '(Hrsg.)' WHERE NOT EXISTS (SELECT * FROM book.persons WHERE first_name = 'Jens Deerberg-Wittram' AND last_name = '(Hrsg.)');
INSERT INTO book.books       (isbn_13, issn, title, subtitle, description, cover, edition, release_year, pages, code_identifier, publisher_id, designation_id, series_id, language_id, physical_size_id)       VALUES       ('9783954663958', NULL, 'Das Martini-Prinzip', 'Spitzenmedizin durch Spezialisierung, Ergebnistransparenz und Patientenorientierung', NULL, NULL, NULL, 2018, NULL, 'DH17', (SELECT id FROM book.publishers WHERE name = 'Madizinisch Wissenschaftliche Verlagsgesellschaft'), (SELECT id FROM book.designations WHERE name = 'STS'), NULL, (SELECT id FROM book.languages WHERE iso_code = 'ger'), (SELECT id FROM book.physical_sizes WHERE name = 'normal'));
INSERT INTO book.copies (book_id, status_id) VALUES ((SELECT id FROM book.books WHERE title = 'Das Martini-Prinzip' AND subtitle = 'Spitzenmedizin durch Spezialisierung, Ergebnistransparenz und Patientenorientierung'), 1);
INSERT INTO book.books_authors (book_id, person_id) VALUES ((SELECT id FROM book.books WHERE title = 'Das Martini-Prinzip' AND subtitle = 'Spitzenmedizin durch Spezialisierung, Ergebnistransparenz und Patientenorientierung'), (SELECT id FROM book.persons WHERE first_name = 'Hartwig' AND last_name = 'Huland'));
INSERT INTO book.books_authors (book_id, person_id) VALUES ((SELECT id FROM book.books WHERE title = 'Das Martini-Prinzip' AND subtitle = 'Spitzenmedizin durch Spezialisierung, Ergebnistransparenz und Patientenorientierung'), (SELECT id FROM book.persons WHERE first_name = 'Markus' AND last_name = 'Graefen'));
INSERT INTO book.books_authors (book_id, person_id) VALUES ((SELECT id FROM book.books WHERE title = 'Das Martini-Prinzip' AND subtitle = 'Spitzenmedizin durch Spezialisierung, Ergebnistransparenz und Patientenorientierung'), (SELECT id FROM book.persons WHERE first_name = 'Jens Deerberg-Wittram' AND last_name = '(Hrsg.)'));
INSERT INTO book.books_subject_areas (book_id, subject_area_id) VALUES ((SELECT id FROM book.books WHERE title = 'Das Martini-Prinzip' AND subtitle = 'Spitzenmedizin durch Spezialisierung, Ergebnistransparenz und Patientenorientierung'), (SELECT id FROM book.subject_areas WHERE name = 'Medicine'));
INSERT INTO book.publishers (name) SELECT 'Madizinisch Wissenschaftliche Verlagsgesellschaft' WHERE NOT EXISTS (SELECT * FROM book.publishers WHERE name = 'Madizinisch Wissenschaftliche Verlagsgesellschaft');
INSERT INTO book.subject_areas (name) SELECT 'Medicine' WHERE NOT EXISTS (SELECT * FROM book.subject_areas WHERE name = 'Medicine');
INSERT INTO book.persons (first_name, last_name) SELECT 'Erwin', 'Böttinger' WHERE NOT EXISTS (SELECT * FROM book.persons WHERE first_name = 'Erwin' AND last_name = 'Böttinger');
INSERT INTO book.persons (first_name, last_name) SELECT 'Jasper zu Putlitz', '(Hrsg.)' WHERE NOT EXISTS (SELECT * FROM book.persons WHERE first_name = 'Jasper zu Putlitz' AND last_name = '(Hrsg.)');
INSERT INTO book.books       (isbn_13, issn, title, subtitle, description, cover, edition, release_year, pages, code_identifier, publisher_id, designation_id, series_id, language_id, physical_size_id)       VALUES       ('9783954663989', NULL, 'Die Zukunft der Medizin', 'Disruptive Innovationen revolutionieren Medizin und Gesundheit', NULL, NULL, NULL, 2019, NULL, 'DH18', (SELECT id FROM book.publishers WHERE name = 'Madizinisch Wissenschaftliche Verlagsgesellschaft'), (SELECT id FROM book.designations WHERE name = 'STS'), NULL, (SELECT id FROM book.languages WHERE iso_code = 'ger'), (SELECT id FROM book.physical_sizes WHERE name = 'normal'));
INSERT INTO book.copies (book_id, status_id) VALUES ((SELECT id FROM book.books WHERE title = 'Die Zukunft der Medizin' AND subtitle = 'Disruptive Innovationen revolutionieren Medizin und Gesundheit'), 1);
INSERT INTO book.books_authors (book_id, person_id) VALUES ((SELECT id FROM book.books WHERE title = 'Die Zukunft der Medizin' AND subtitle = 'Disruptive Innovationen revolutionieren Medizin und Gesundheit'), (SELECT id FROM book.persons WHERE first_name = 'Erwin' AND last_name = 'Böttinger'));
INSERT INTO book.books_authors (book_id, person_id) VALUES ((SELECT id FROM book.books WHERE title = 'Die Zukunft der Medizin' AND subtitle = 'Disruptive Innovationen revolutionieren Medizin und Gesundheit'), (SELECT id FROM book.persons WHERE first_name = 'Jasper zu Putlitz' AND last_name = '(Hrsg.)'));
INSERT INTO book.books_subject_areas (book_id, subject_area_id) VALUES ((SELECT id FROM book.books WHERE title = 'Die Zukunft der Medizin' AND subtitle = 'Disruptive Innovationen revolutionieren Medizin und Gesundheit'), (SELECT id FROM book.subject_areas WHERE name = 'Medicine'));
INSERT INTO book.publishers (name) SELECT 'Harvard Business Review' WHERE NOT EXISTS (SELECT * FROM book.publishers WHERE name = 'Harvard Business Review');
INSERT INTO book.subject_areas (name) SELECT 'Health Care' WHERE NOT EXISTS (SELECT * FROM book.subject_areas WHERE name = 'Health Care');
INSERT INTO book.persons (first_name, last_name) SELECT 'Michael E.', 'Porter' WHERE NOT EXISTS (SELECT * FROM book.persons WHERE first_name = 'Michael E.' AND last_name = 'Porter');
INSERT INTO book.persons (first_name, last_name) SELECT 'Elizabeth Olmsted', 'Teisberg' WHERE NOT EXISTS (SELECT * FROM book.persons WHERE first_name = 'Elizabeth Olmsted' AND last_name = 'Teisberg');
INSERT INTO book.books       (isbn_13, issn, title, subtitle, description, cover, edition, release_year, pages, code_identifier, publisher_id, designation_id, series_id, language_id, physical_size_id)       VALUES       ('9781591397786', NULL, 'Redefining Health Care', 'Creating Value-Based Competition on Results', NULL, NULL, NULL, 2006, NULL, 'DH19', (SELECT id FROM book.publishers WHERE name = 'Harvard Business Review'), (SELECT id FROM book.designations WHERE name = 'STS'), NULL, (SELECT id FROM book.languages WHERE iso_code = 'eng'), (SELECT id FROM book.physical_sizes WHERE name = 'normal'));
INSERT INTO book.copies (book_id, status_id) VALUES ((SELECT id FROM book.books WHERE title = 'Redefining Health Care' AND subtitle = 'Creating Value-Based Competition on Results'), 1);
INSERT INTO book.books_authors (book_id, person_id) VALUES ((SELECT id FROM book.books WHERE title = 'Redefining Health Care' AND subtitle = 'Creating Value-Based Competition on Results'), (SELECT id FROM book.persons WHERE first_name = 'Michael E.' AND last_name = 'Porter'));
INSERT INTO book.books_authors (book_id, person_id) VALUES ((SELECT id FROM book.books WHERE title = 'Redefining Health Care' AND subtitle = 'Creating Value-Based Competition on Results'), (SELECT id FROM book.persons WHERE first_name = 'Elizabeth Olmsted' AND last_name = 'Teisberg'));
INSERT INTO book.books_subject_areas (book_id, subject_area_id) VALUES ((SELECT id FROM book.books WHERE title = 'Redefining Health Care' AND subtitle = 'Creating Value-Based Competition on Results'), (SELECT id FROM book.subject_areas WHERE name = 'Health Care'));
