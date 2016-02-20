require_relative "./_configure"

DB.define_table("artists")
DB.define_column("artists", "name", "string")
#DB.define_column("artists", "rank", "integer")
