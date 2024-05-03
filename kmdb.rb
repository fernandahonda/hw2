# In this assignment, you'll be using the domain model from hw1 (found in the hw1-solution.sql file)
# to create the database structure for "KMDB" (the Kellogg Movie Database).
# The end product will be a report that prints the movies and the top-billed
# cast for each movie in the database.

# To run this file, run the following command at your terminal prompt:
# `rails runner kmdb.rb`

# Requirements/assumptions
#
# - There will only be three movies in the database – the three films
#   that make up Christopher Nolan's Batman trilogy.
# - Movie data includes the movie title, year released, MPAA rating,
#   and studio.
# - There are many studios, and each studio produces many movies, but
#   a movie belongs to a single studio.
# - An actor can be in multiple movies.
# - Everything you need to do in this assignment is marked with TODO!
# - Note rubric explanation for appropriate use of external resources.

# Rubric
# 
# There are three deliverables for this assignment, all delivered within
# this repository and submitted via GitHub and Canvas:
# - Generate the models and migration files to match the domain model from hw1.
#   Table and columns should match the domain model. Execute the migration
#   files to create the tables in the database. (5 points)
# - Insert the "Batman" sample data using ruby code. Do not use hard-coded ids.
#   Delete any existing data beforehand so that each run of this script does not
#   create duplicate data. (5 points)
# - Query the data and loop through the results to display output similar to the
#   sample "report" below. (10 points)
# - You are welcome to use external resources for help with the assignment (including
#   colleagues, AI, internet search, etc). However, the solution you submit must
#   utilize the skills and strategies covered in class. Alternate solutions which
#   do not demonstrate an understanding of the approaches used in class will receive
#   significant deductions. Any concern should be raised with faculty prior to the due date.

# Submission
# 
# - "Use this template" to create a brand-new "hw2" repository in your
#   personal GitHub account, e.g. https://github.com/<USERNAME>/hw2
# - Do the assignment, committing and syncing often
# - When done, commit and sync a final time before submitting the GitHub
#   URL for the finished "hw2" repository as the "Website URL" for the 
#   Homework 2 assignment in Canvas

# Successful sample output is as shown:

# Movies
# ======

# Batman Begins          2005           PG-13  Warner Bros.
# The Dark Knight        2008           PG-13  Warner Bros.
# The Dark Knight Rises  2012           PG-13  Warner Bros.

# Top Cast
# ========

# Batman Begins          Christian Bale        Bruce Wayne
# Batman Begins          Michael Caine         Alfred
# Batman Begins          Liam Neeson           Ra's Al Ghul
# Batman Begins          Katie Holmes          Rachel Dawes
# Batman Begins          Gary Oldman           Commissioner Gordon
# The Dark Knight        Christian Bale        Bruce Wayne
# The Dark Knight        Heath Ledger          Joker
# The Dark Knight        Aaron Eckhart         Harvey Dent
# The Dark Knight        Michael Caine         Alfred
# The Dark Knight        Maggie Gyllenhaal     Rachel Dawes
# The Dark Knight Rises  Christian Bale        Bruce Wayne
# The Dark Knight Rises  Gary Oldman           Commissioner Gordon
# The Dark Knight Rises  Tom Hardy             Bane
# The Dark Knight Rises  Joseph Gordon-Levitt  John Blake
# The Dark Knight Rises  Anne Hathaway         Selina Kyle

# Delete existing data, so you'll start fresh each time this script is run.
# Use `Model.destroy_all` code.
Studio.destroy_all
Movie.destroy_all
Actor.destroy_all
Character.destroy_all

# Generate models and tables, according to the domain model
# - Ran in terminal:
# -- rails generate model Studio
# -- rails generate model Movie
# -- rails generate model Actor
# -- rails generate model Character
# -- rails db:migrate

# - Opened db/migrate/202405..._create_characters.rb
# - Edited all 4 files

# Insert data into the database that reflects the sample data shown above.
# Do not use hard-coded foreign key IDs.

# Create Studio
new_studio = Studio.new
new_studio["studio_name"] = "Warner Bros."
new_studio.save

# Create Movie
warner = Studio.find_by({ "studio_name" => "Warner Bros."})

movie1 = Movie.new
movie1["title"] = "Batman Begins"
movie1["release_year"] = 2005
movie1["rating"] = "PG-13"
movie1["studio_id"] = warner["id"]
movie1.save

movie2 = Movie.new
movie2["title"] = "The Dark Knight"
movie2["release_year"] = 2008
movie2["rating"] = "PG-13"
movie2["studio_id"] = warner["id"]
movie2.save

movie3 = Movie.new
movie3["title"] = "The Dark Knight Rises"
movie3["release_year"] = 2012
movie3["rating"] = "PG-13"
movie3["studio_id"] = warner["id"]
movie3.save

# Create Actors (shorter method: sorry! too many items to add using the longer version!)
actors_data = [
  'Christian Bale', 'Michael Caine', 'Liam Neeson', 'Katie Holmes',
  'Gary Oldman', 'Heath Ledger', 'Aaron Eckhart', 'Maggie Gyllenhaal',
  'Tom Hardy', 'Joseph Gordon-Levitt', 'Anne Hathaway'
]

actors_data.each do |actor_name|
  Actor.create(actor_name: actor_name)
end

# Assign Characters to Movies (shorter method: sorry! too many items to add using the longer version!)
characters_data = [
  { movie_id: Movie.find_by(title: 'Batman Begins')["id"], actor_id: Actor.find_by(actor_name: 'Christian Bale')["id"], character_name: 'Bruce Wayne' },
  { movie_id: Movie.find_by(title: 'Batman Begins')["id"], actor_id: Actor.find_by(actor_name: 'Michael Caine')["id"], character_name: 'Alfred' },
  { movie_id: Movie.find_by(title: 'Batman Begins')["id"], actor_id: Actor.find_by(actor_name: 'Liam Neeson')["id"], character_name: 'Ra''s Al Ghul' },
  { movie_id: Movie.find_by(title: 'Batman Begins')["id"], actor_id: Actor.find_by(actor_name: 'Katie Holmes')["id"], character_name: 'Rachel Dawes' },
  { movie_id: Movie.find_by(title: 'Batman Begins')["id"], actor_id: Actor.find_by(actor_name: 'Gary Oldman')["id"], character_name: 'Commissioner Gordon' },
  { movie_id: Movie.find_by(title: 'The Dark Knight')["id"], actor_id: Actor.find_by(actor_name: 'Christian Bale')["id"], character_name: 'Bruce Wayne' },
  { movie_id: Movie.find_by(title: 'The Dark Knight')["id"], actor_id: Actor.find_by(actor_name: 'Heath Ledger')["id"], character_name: 'Joker' },
  { movie_id: Movie.find_by(title: 'The Dark Knight')["id"], actor_id: Actor.find_by(actor_name: 'Aaron Eckhart')["id"], character_name: 'Harvey Dent' },
  { movie_id: Movie.find_by(title: 'The Dark Knight')["id"], actor_id: Actor.find_by(actor_name: 'Michael Caine')["id"], character_name: 'Alfred' },
  { movie_id: Movie.find_by(title: 'The Dark Knight')["id"], actor_id: Actor.find_by(actor_name: 'Maggie Gyllenhaal')["id"], character_name: 'Rachel Dawes' },
  { movie_id: Movie.find_by(title: 'The Dark Knight Rises')["id"], actor_id: Actor.find_by(actor_name: 'Christian Bale')["id"], character_name: 'Bruce Wayne' },
  { movie_id: Movie.find_by(title: 'The Dark Knight Rises')["id"], actor_id: Actor.find_by(actor_name: 'Gary Oldman')["id"], character_name: 'Commissioner Gordon' },
  { movie_id: Movie.find_by(title: 'The Dark Knight Rises')["id"], actor_id: Actor.find_by(actor_name: 'Tom Hardy')["id"], character_name: 'Bane' },
  { movie_id: Movie.find_by(title: 'The Dark Knight Rises')["id"], actor_id: Actor.find_by(actor_name: 'Joseph Gordon-Levitt')["id"], character_name: 'John Blake' },
  { movie_id: Movie.find_by(title: 'The Dark Knight Rises')["id"], actor_id: Actor.find_by(actor_name: 'Anne Hathaway')["id"], character_name: 'Selina Kyle' }
]

characters_data.each do |character_data|
  Character.create(character_data)
end

# Prints a header for the movies output
puts "Movies"
puts "======"
puts ""

# Query the movies data and loop through the results to display the movies output.
# Movies

warner = Studio.find_by({ "studio_name" => "Warner Bros."})
all_movies = Movie.all

for movie in all_movies
  title = movie["title"]
  release_year = movie["release_year"]
  rating = movie["rating"]
  studio = warner["studio_name"]
  # puts "#{title} #{release_year} #{rating} #{studio}"
  puts "#{title.ljust(22)} #{release_year.to_s.ljust(13)} #{rating.ljust(8)} #{studio}"
end

# Movies
# ======

# Batman Begins          2005           PG-13  Warner Bros.
# The Dark Knight        2008           PG-13  Warner Bros.
# The Dark Knight Rises  2012           PG-13  Warner Bros.

# Prints a header for the cast output
puts ""
puts "Top Cast"
puts "========"
puts ""

# Query the cast data and loop through the results to display the cast output for each movie.

# Top Cast
# ========

all_characters = Character.all

for character in all_characters
  movie = Movie.find_by({ "id" => character["movie_id"]})
  movie_name = movie["title"]

  actor = Actor.find_by({ "id" => character["actor_id"]})
  actor_name = actor["actor_name"]

  character_name = character["character_name"]

  # puts "#{movie_name} #{actor_name} #{character_name}"
  puts "#{movie_name.ljust(22)} #{actor_name.to_s.ljust(22)} #{character_name}"
end

# Batman Begins          Christian Bale        Bruce Wayne
# Batman Begins          Michael Caine         Alfred
# Batman Begins          Liam Neeson           Ra's Al Ghul
# Batman Begins          Katie Holmes          Rachel Dawes
# Batman Begins          Gary Oldman           Commissioner Gordon
# The Dark Knight        Christian Bale        Bruce Wayne
# The Dark Knight        Heath Ledger          Joker
# The Dark Knight        Aaron Eckhart         Harvey Dent
# The Dark Knight        Michael Caine         Alfred
# The Dark Knight        Maggie Gyllenhaal     Rachel Dawes
# The Dark Knight Rises  Christian Bale        Bruce Wayne
# The Dark Knight Rises  Gary Oldman           Commissioner Gordon
# The Dark Knight Rises  Tom Hardy             Bane
# The Dark Knight Rises  Joseph Gordon-Levitt  John Blake
# The Dark Knight Rises  Anne Hathaway         Selina Kyle