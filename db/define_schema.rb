require_relative "./_configure"

DB.define_table("scores")
DB.define_column("scores","name", "string")
DB.define_column("scores","tally", "integer")