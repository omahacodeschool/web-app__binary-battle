require_relative "./_configure"

DB.define_table("legends")
DB.define_column("legends", "name", "string")