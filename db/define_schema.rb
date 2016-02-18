require_relative "./_configure"

DB.define_table("movies")
DB.define_column("movies", "movie_name", "string")
DB.define_column("movies", "vote_count", "integer")


DB.define_table("buildings")
DB.define_column("buildings", "building_name", "string")
DB.define_column("buildings", "vote_count", "integer")
DB.define_column("buildings", "building_image", "string")
DB.define_column("buildings", "architect", "string")