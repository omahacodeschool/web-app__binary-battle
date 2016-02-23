require_relative "./_configure"

DB.define_table("movies")
DB.define_column("movies", "movie_name", "string")

DB.define_table("battles")
DB.define_column("battles", "movie_left", "integer")
DB.define_column("battles", "movie_right", "integer")
DB.define_column("battles", "movie_loser", "integer")
DB.define_column("battles", "movie_winner", "integer")
