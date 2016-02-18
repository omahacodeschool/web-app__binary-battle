require_relative "./_configure"

DB.define_table("planets")
DB.define_column("planets", "planet", "string")
DB.define_column("planets", "points", "integer")

DB.define_table("best_legs")
DB.define_column("best_legs", "planet", "string")
DB.define_column("best_legs", "points", "integer")

DB.define_table("best_smile")
DB.define_column("best_smile", "planet", "string")
DB.define_column("best_smile", "points", "integer")

DB.define_table("most_likely_to_become_president")
DB.define_column("most_likely_to_become_president", "planet", "string")
DB.define_column("most_likely_to_become_president", "points", "integer")