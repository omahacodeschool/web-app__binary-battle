require_relative "./_configure"

DB.define_table("movies")
DB.define_column("movies", "movie_name", "string")
DB.define_column("movies", "voted", "boolean")

#Is a second table even necessary?
DB.define_table("counts")
DB.define_column("counts", "movie_id", "integer")
DB.define_column("counts", "vote_count", "integer")
