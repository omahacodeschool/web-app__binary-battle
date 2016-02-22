require_relative "./_configure"

DB.define_table("scores")
DB.define_column("scores","dwarf_name", "string")
DB.define_column("scores","tally", "integer")