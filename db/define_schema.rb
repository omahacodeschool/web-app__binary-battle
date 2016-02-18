require_relative "./_configure"

DB.define_table("avengers")
DB.define_column("avengers", "name", "string")
DB.define_column("avengers", "votes", "integer")
