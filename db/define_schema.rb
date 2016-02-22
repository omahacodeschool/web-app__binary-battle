require_relative "./_configure"

DB.define_table("fighters")
DB.define_column("fighters", "name", "string")
DB.define_column("fighters", "style", "string")

DB.define_table("results")
DB.define_column("results","fighter_id_1","integer")
DB.define_column("results","fighter_id_2","integer")
DB.define_column("results","winner","integer")