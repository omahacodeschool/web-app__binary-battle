require_relative "./_configure"

DB.define_table("dwarves")
DB.define_column("dwarves","name", "string")
DB.define_column("dwarves","tally", "integer")

DB.define_table("matches")
DB.define_column("matches","winner", "integer")
DB.define_column("matches","loser", "integer")