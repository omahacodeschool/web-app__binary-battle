require_relative "./_configure"

DB.define_table("legends")
DB.define_column("legends", "name", "string")

# DB.define_table("votes")
# DB.define_column()