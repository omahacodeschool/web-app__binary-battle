require_relative "./_configure"

DB.define_table("competitors")
DB.define_column("competitors", "name", "string")
DB.define_column("competitors", "category_id", "string")

DB.define_table("categories")
DB.define_column("categories", "name", "string")

DB.define_table("matchups")
DB.define_column("matchups", "winner_competitor_id", "integer")
DB.define_column("matchups", "loser_competitor_id", "integer")