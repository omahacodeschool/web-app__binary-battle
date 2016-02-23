require_relative "./_configure"

DB.define_table("characters")
DB.define_column("characters","character_name","string")
DB.define_column("characters","universe_id","integer")


DB.define_table("battles")
DB.define_column("battles","winner_id","integer")
DB.define_column("battles","loser_id","integer")

DB.define_table("universes")
DB.define_column("universes","universe_name","string")