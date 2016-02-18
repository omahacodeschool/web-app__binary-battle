require_relative "./_configure"

DB.define_table("competitors")
DB.define_column("competitors", "name", "string")

DB.define_table("matchups")
DB.define_column("matchups", "first_competitor_id", "integer")
DB.define_column("matchups", "second_competitor_id", "integer")
DB.define_column("matchups", "winner_competitor_id", "integer")