require_relative "./_configure"

DB.define_table("cats")
DB.define_column("cats", "name", "string")
DB.define_column("cats", "likes", "integer")
