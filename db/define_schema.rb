require_relative "./_configure"

DB.define_table("movies")
DB.define_column("movies", "movie_name", "string")

DB.define_table("counts")
DB.define_column("counts", "movie1_id", "integer")
DB.define_column("counts", "movie2_id", "integer")
DB.define_column("counts", "winner_id", "integer")
DB.define_column("counts", "loser_id", "integer")


DB.define_table("buildings")
DB.define_column("buildings", "building_name", "string")
DB.define_column("buildings", "vote_count", "integer")
DB.define_column("buildings", "building_image", "string")
DB.define_column("buildings", "architect", "string")