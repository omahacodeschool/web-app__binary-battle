require_relative "./_configure"

# Define your tables and their columns below this line.
# -----------------------------------------------------------------------------
DB.define_table("competitors")
DB.define_column("competitors", "name", "string")
DB.define_column("competitors", "competitor_type", "string")

DB.define_table("results")
DB.define_column("results","comp_id_1","integer")
DB.define_column("results","comp_id_2","integer")
DB.define_column("results","winner","integer")

# Column names should be all lowercase and have no spaces or any other special
# characters--except for underscores. So "running_time" is valid, but
# "running time" and "running_time!" are not vaild.

# The `id` column and timestamp columns are automatically added.
# Do not define those columns yourself.

# What table do you need to store the necessary information?
# What columns do you need in that table?