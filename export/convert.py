import sys, csv, re
from pathlib import Path
import urllib.request

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
    if 'sts' in row[6] or 'STS' in row[6]:
      self.designation = 'STS'
    elif 'se' in row[6] or 'SE' in row[6]:
      self.designation = 'SE'
    elif 'id' in row[6] or 'ID' in row[6]:
      self.designation = 'ID'
    elif 'pm' in row[6] or 'PM' in row[6]:
      self.designation = 'PM'
    elif 'dh' in row[6] or 'DH' in row[6]:
      self.designation = 'DH'
    elif 'is' in row[6] or 'IS' in row[6]:
      self.designation = 'IS'
    elif 'xxl' in row[6] or 'XXL' in row[6]:
      self.designation = 'XXL'

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

  def generate_sql(self, f_sql):
    # publishers
    f_sql.write("INSERT INTO publishers (name) SELECT '{}' WHERE NOT EXISTS (SELECT * FROM publishers WHERE name = '{}');\n".format(self.publisher, self.publisher))

    # subject_areas
    for i in self.subject_area:
      f_sql.write("INSERT INTO subject_areas (name) SELECT '{}' WHERE NOT EXISTS (SELECT * FROM subject_areas WHERE name = '{}');\n".format(i, i))

    # authors
    for i in self.authors_editors:
      f_sql.write("INSERT INTO persons (first_name, last_name) SELECT '{}', '{}' WHERE NOT EXISTS (SELECT * FROM persons WHERE first_name = '{}' AND last_name = '{}');\n".format(i[0], i[1], i[0], i[1]))

    # books
    f_sql.write("INSERT INTO books \
      (isbn_13, issn, title, subtitle, description, cover, edition, release_year, pages, code_identifier, publisher_id, designation_id, series_id, language_id, physical_size_id) \
      VALUES \
      ('{}', {}, '{}', '{}', {}, {}, {}, {}, {}, '{}', {}, {}, {}, {}, {});\n"\
      .format(self.isbn_13, self.issn, self.title, self.subtitle, self.description, self.cover, self.edition, self.release_year, self.pages, self.code_identifier, "(SELECT id FROM publishers WHERE name = '{}')".format(self.publisher), "(SELECT id FROM designations WHERE name = '{}')".format(self.designation), self.series, "(SELECT id FROM languages WHERE iso_code = '{}')".format(self.language), "(SELECT id FROM physical_sizes WHERE name = '{}')".format(self.physical_size)))

    # copies
    for i in range(0, self.copies):
        f_sql.write("INSERT INTO copies (book_id, status_id) VALUES ({}, 1);".format("(SELECT id FROM books WHERE title = '{}' AND subtitle = '{}')".format(self.title, self.subtitle)))

    # authors -> books
    for i in self.authors_editors:
      f_sql.write("INSERT INTO books_authors (book_id, person_id) VALUES ({}, {});\n".format("(SELECT id FROM books WHERE title = '{}' AND subtitle = '{}')".format(self.title, self.subtitle), "(SELECT id FROM persons WHERE first_name = '{}' AND last_name = '{}')".format(i[0], i[1])))

    # subject_areas -> books
    for i in self.subject_area:
      f_sql.write("INSERT INTO books_subject_areas (book_id, subject_area_id) VALUES ({}, {});\n".format("(SELECT id FROM books WHERE title = '{}' AND subtitle = '{}')".format(self.title, self.subtitle), "(SELECT id FROM subject_areas WHERE name = '{}')".format(i)))


if __name__ == '__main__':
  book_cover_id = 0
  Path("book_cover").mkdir(parents=True, exist_ok=True)
  with open(sys.argv[1], 'r') as f_csv:
    with open('all.sql', 'a') as f_sql:
      with open('book_cover.csv', 'a') as f_book_cover:
        for row in csv.reader(f_csv, delimiter=',', quotechar='"'):
          book = Book(row)
          book.cover = book_cover_id
          book.generate_sql(f_sql)
          f_book_cover.write('{},"{}"\n'.format(book_cover_id, row[5]))
          try:
            urllib.request.urlretrieve(row[5], "book_cover/{}.jpg".format(book_cover_id))
          except:
              print("Error: Failed to fetch cover for book cover id {}".format(book_cover_id))
          book_cover_id += 1

