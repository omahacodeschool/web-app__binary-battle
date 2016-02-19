require_relative "./_configure"

DB.define_table("avengers")
DB.define_column("avengers", "name", "string")

DB.define_table("showdowns")
DB.define_column("showdowns", "winner_id", "integer")
DB.define_column("showdowns", "loser_id", "integer")
