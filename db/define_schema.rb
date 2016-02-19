require_relative "./_configure"

DB.define_table("dwarves")
DB.define_column("dwarves", "name", "string")