require_relative "./_configure"

DB.define_table("planets")
DB.define_column("planets", "planets", "string")
DB.define_column("planets", "points", "integer")