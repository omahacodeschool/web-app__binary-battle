require_relative "./_configure"

DB.define_table("planets")
DB.define_column("planets", "planet", "string")
DB.define_column("planets", "points", "integer")