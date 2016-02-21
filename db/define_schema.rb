require_relative "./_configure"

DB.define_table("bands")
DB.define_column("bands", "name", "string")

DB.define_table("results")
DB.define_column("results", "winner_id", "integer")
DB.define_column("results", "loser_id", "integer")