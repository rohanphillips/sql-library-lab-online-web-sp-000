def select_books_titles_and_years_in_first_series_order_by_year
  "SELECT title, year
  FROM books
  INNER JOIN (SELECT id FROM series ORDER BY id ASC LIMIT 1) series
  WHERE books.series_id = series.id"
end

def select_name_and_motto_of_char_with_longest_motto
  "SELECT name, motto
  FROM characters
  ORDER BY LENGTH(motto) DESC LIMIT 1"
end


def select_value_and_count_of_most_prolific_species
  "SELECT species, COUNT(species)
  FROM characters
  GROUP BY species
    ORDER BY COUNT(species) DESC LIMIT 1"
end

def select_name_and_series_subgenres_of_authors
  "SELECT authors.name, subgenres.name
  FROM authors
  JOIN series ON authors.id = series.author_id
  JOIN subgenres ON series.author_id = subgenres.id"
end

def select_series_title_with_most_human_characters
  "SELECT title
  FROM series
  JOIN
  (SELECT author_id, species, COUNT(species) AS species_count
    FROM characters
    WHERE species = 'human'
    GROUP BY author_id
    ORDER BY COUNT(species) DESC LIMIT 1
  ) characters ON series.author_id = characters.author_id"
end

def select_character_names_and_number_of_books_they_are_in
  "SELECT characters.name, COUNT(character_books.book_id)
  FROM character_books
  JOIN characters ON character_books.character_id = characters.id
  GROUP BY characters.name, character_books.book_id
  "
end
