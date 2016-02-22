require_relative "./_configure"

DB.define_table("legends")
DB.define_column("legends", "name", "string")

DB.define_table("results")
DB.define_column("results", "winner_id", "integer")
DB.define_column("results", "loser_id", "integer")