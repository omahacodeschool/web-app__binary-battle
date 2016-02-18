require_relative "./_configure"

DB.define_table("nominees")
DB.define_column("nominees", "name", "string")
DB.define_column("nominees", "bio", "text")
DB.define_column("nominees", "image", "string")
DB.define_column("nominees", "thumbnail", "string")
DB.define_column("nominees", "locked", "boolean")

DB.define_table("categories")
DB.define_column("categories", "name", "string")
DB.define_column("categories", "description", "text")
DB.define_column("categories", "image", "string")
DB.define_column("categories", "locked", "boolean")

DB.define_table("pools")
DB.define_column("pools", "nominee_id", "integer")
DB.define_column("pools", "category_id", "integer")
DB.define_column("pools", "locked", "boolean")

DB.define_table("results")
DB.define_column("results", "loved_id", "integer")
DB.define_column("results", "lost_id", "integer")
DB.define_column("results", "locked", "boolean")

