import sys, csv, re

class Book:
  def __init__(self, row):

    # isbn_13
    if '' == row[0]:
      self.isbn_13 = 'NULL'
    elif len(row[0]) > 13:
      print('Error isbn-13: {}'.format(row[0]))
    else:
      self.isbn_13 = row[0]

    # issn
    self.issn = 'NULL'

    # title
    self.title = row[1].replace('\'', '\'\'').strip()

    # subtitle
    self.subtitle = row[2].replace('\'', '\'\'').strip()

    # description
    self.description = 'NULL'

    # cover
    self.cover = 'NULL'

    # edition
    self.edition = 'NULL'

    # release_year
    self.release_year = int(row[8])

    # pages
    self.pages = 'NULL'

    # code_identifier
    self.code_identifier = row[10]

    # publisher
    self.publisher = row[4].replace('\'', '\'\'').strip()

    # designation
    if 'sts' or 'STS' in row[6]:
      self.designation = 'STS'
    elif 'se' or 'SE' in row[6]:
      self.designation = 'SE'
    elif 'id' or 'ID' in row[6]:
      self.designation = 'ID'
    elif 'pm' or 'PM' in row[6]:
      self.designation = 'PM'

    # series
    self.series = 'NULL'

    # language
    if 'de' in row[9] or 'DE' in row[9]:
      self.language = 'ger'
    elif 'en' in row[9] or 'EN' in row[9]:
      self.language = 'eng'

    # physical_size
    if 'XXL' in row[10]:
      self.physical_size = 'xxl'
    else:
      self.physical_size = 'normal'

    # subject_area
    self.subject_area = []
    for i in re.split('/|,|&', row[7]):
      self.subject_area.append(i.replace('\'', '\'\'').strip())

    # author
    self.authors_editors = []
    for i in enumerate(re.split('/|,|&', row[3])):
      self.authors_editors.append(i[1].replace('\'', '\'\'').strip())

    for i in enumerate(self.authors_editors):
      splitted = i[1].rsplit(maxsplit=1)
      if len(splitted) == 2:
        self.authors_editors[i[0]] = splitted
      else:
        splitted.append('')
        self.authors_editors[i[0]] = splitted

    # copies
    self.copies = int(row[11])

  def generate_sql(self):
    # publishers
    print("INSERT INTO publishers (name) SELECT '{}' WHERE NOT EXISTS (SELECT * FROM publishers WHERE name = '{}');".format(self.publisher, self.publisher))

    # subject_areas
    for i in self.subject_area:
      print("INSERT INTO subject_areas (name) SELECT '{}' WHERE NOT EXISTS (SELECT * FROM subject_areas WHERE name = '{}');".format(i, i))

    # authors
    for i in self.authors_editors:
      print("INSERT INTO persons (first_name, last_name) SELECT '{}', '{}' WHERE NOT EXISTS (SELECT * FROM persons WHERE first_name = '{}' AND last_name = '{}');".format(i[0], i[1], i[0], i[1]))

    # books
    print("INSERT INTO books \
      (isbn_13, issn, title, subtitle, description, cover, edition, release_year, pages, code_identifier, publisher_id, designation_id, series_id, language_id, physical_size_id) \
      VALUES \
      ('{}', {}, '{}', '{}', {}, {}, {}, {}, {}, '{}', {}, {}, {}, {}, {});"\
      .format(self.isbn_13, self.issn, self.title, self.subtitle, self.description, self.cover, self.edition, self.release_year, self.pages, self.code_identifier, "(SELECT id FROM publishers WHERE name = '{}')".format(self.publisher), "(SELECT id FROM designations WHERE name = '{}')".format(self.designation), self.series, "(SELECT id FROM languages WHERE iso_code = '{}')".format(self.language), "(SELECT id FROM physical_sizes WHERE name = '{}')".format(self.physical_size)))

    # copies
    print("INSERT INTO copies (book_id, status_id) VALUES ({}, 1);".format("(SELECT id FROM books WHERE title = '{}' AND subtitle = '{}')".format(self.title, self.subtitle)))

    # authors -> books
    for i in self.authors_editors:
      print("INSERT INTO books_authors (book_id, person_id) VALUES ({}, {});".format("(SELECT id FROM books WHERE title = '{}' AND subtitle = '{}')".format(self.title, self.subtitle), "(SELECT id FROM persons WHERE first_name = '{}' AND last_name = '{}')".format(i[0], i[1])))

    # subject_areas -> books
    for i in self.subject_area:
      print("INSERT INTO books_subject_areas (book_id, subject_area_id) VALUES ({}, {});".format("(SELECT id FROM books WHERE title = '{}' AND subtitle = '{}')".format(self.title, self.subtitle), "(SELECT id FROM subject_areas WHERE name = '{}')".format(i)))
    


if __name__ == '__main__':
  with open(sys.argv[1], 'r') as f_csv:
    next(f_csv)
    for row in csv.reader(f_csv, delimiter=',', quotechar='"'):
      book = Book(row)
      book.generate_sql()
