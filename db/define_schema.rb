require_relative "./_configure"

DB.define_table("categories")
DB.define_column("categories", "category_title", "string")

DB.define_table("nominees")
DB.define_column("nominees", "category_id", "integer")
DB.define_column("nominees", "nominee", "string")
DB.define_column("nominees", "nominee_image", "string")

