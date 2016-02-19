require_relative "./_configure"

DB.define_table("movies")
DB.define_column("movies", "movie_name", "string")
DB.define_column("movies", "vote_count", "integer")

DB.define_table("counts")
DB.define_column("counts", "movie_id", "integer")
DB.define_column("counts", "yes_votes", "integer")
DB.define_column("counts", "no_votes", "integer")


DB.define_table("buildings")
DB.define_column("buildings", "building_name", "string")
DB.define_column("buildings", "vote_count", "integer")
DB.define_column("buildings", "building_image", "string")
DB.define_column("buildings", "architect", "string")