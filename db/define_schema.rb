require_relative "./_configure"

DB.define_table("entries")
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
DB.define_column("battles", "locked", "boolean")

DB.define_table("results")
DB.define_column("results", "score", "integer")
DB.define_column("results", "entry_id", "integer")
DB.define_column("results", "battle_id", "integer")