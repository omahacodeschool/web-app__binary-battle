require_relative "./_configure"

DB.define_table("cats")
DB.define_column("cats", "name", "string")
DB.define_column("cats", "photo", "string")

DB.define_table("results")
DB.define_column("results", "winner_id", "integer")
DB.define_column("results", "loser_id", "integer")
