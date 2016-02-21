require_relative "./_configure"

DB.define_table("planets")
DB.define_column("planets", "planet", "string")
DB.define_column("planets", "points", "integer")
DB.define_column("planets", "legs_points", "integer")
DB.define_column("planets", "smile_points", "integer")
DB.define_column("planets", "pres_points", "integer")

DB.define_table("showdowns")
DB.define_column("showdowns", "choice_one", "string")
DB.define_column("showdowns", "choice_two", "string")
DB.define_column("showdowns", "frequency_one", "integer")
DB.define_column("showdowns", "frequency_two", "integer")