require_relative "./_configure"

DB.define_table("categories")
DB.define_column("categories", "category_title", "string")
