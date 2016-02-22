require_relative "./_configure"

DB.define_table("competitors")
DB.define_column("competitors", "name", "string")
DB.define_column("competitors", "style", "string")

DB.define_table("results")
DB.define_column("results","competitor_id_1","integer")
DB.define_column("results","competitor_id_2","integer")
DB.define_column("results","winner","integer")