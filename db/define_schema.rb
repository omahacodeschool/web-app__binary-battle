require_relative "./_configure"

DB.define_table("rockers")
DB.define_column("rockers", "rocker_name", "string")