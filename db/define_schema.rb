require_relative "./_configure"


DB.define_column("entries", "name", "string")
DB.define_column("entries", "bio", "text")
DB.define_column("entries", "image", "string")
DB.define_column("entries", "thumbnail", "string")
DB.define_column("entries", "category_id", "integer")
DB.define_column("entries", "retired", "boolean")

DB.define_table("categories")
DB.define_column("categories", "name", "string")
DB.define_column("categories", "description", "text")
DB.define_column("categories", "image", "string")
DB.define_column("categories", "locked", "boolean")


DB.define_table("results")
DB.define_column("results", "winner_id", "integer")
DB.define_column("results", "loser_id", "integer")
DB.define_column("results", "category_id", "integer")

