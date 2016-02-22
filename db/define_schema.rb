require_relative "./_configure"

DB.define_table("movies")
DB.define_column("movies", "movie_name", "string")
DB.define_column("movies", "winning_percentage", "decimal")
DB.define_column("movies", "o_w_p", "decimal")
DB.define_column("movies", "o_o_w_p", "decimal")
DB.define_column("movies", "rating_percentage_index", "decimal")

DB.define_table("counts")
DB.define_column("counts", "winning_id", "integer")
DB.define_column("counts", "losing_id", "integer")




DB.define_table("buildings")
DB.define_column("buildings", "building_name", "string")
DB.define_column("buildings", "building_image", "string")
DB.define_column("buildings", "architect", "string")

DB.define_table("matches")
DB.define_column("matches", "winning_id", "integer")
DB.define_column("matches", "losing_id", "integer")