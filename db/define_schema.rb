require_relative "./_configure"


DB.define_column("entries", "name", "string")
DB.define_column("entries", "bio", "text")
DB.define_column("entries", "image", "string")
DB.define_column("entries", "thumbnail", "string")
DB.define_column("entries", "battle_id", "integer")
DB.define_column("entries", "retired", "boolean")


DB.define_table("battles")
DB.define_column("battles", "name", "string")
DB.define_column("battles", "description", "text")
DB.define_column("battles", "image", "string")
DB.define_column("battles", "category_id", "integer")

DB.define_table("categories")
DB.define_column("categories", "name", "string")
DB.define_column("categories", "locked", "boolean")


DB.define_table("results")
DB.define_column("results", "score", "integer")
DB.define_column("results", "entry_id", "integer")
DB.define_column("results", "battle_id", "integer")