require_relative "./_configure"

#table: characters
#table : battles
DB.define_table("characters")
DB.define_column("characters","character_name","string")
DB.define_column("characters","scores","integer")

DB.define_table("battles")
DB.define_column("battles","character_1","integer")
DB.define_column("battles","character_2","integer")