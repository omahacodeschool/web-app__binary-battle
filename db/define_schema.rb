require_relative "./_configure"

DB.define_table("artists")
DB.define_column("artists", "name", "string")
DB.define_column("artists", "score", "integer")

DB.define_table("battles")
DB.define_column("battles", "winner", "string")
DB.define_column("battles", "loser", "string")