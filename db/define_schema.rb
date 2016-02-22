require_relative "./_configure"

# Column names should be all lowercase and have no spaces or any other special
# characters--except for underscores. So "running_time" is valid, but
# "running time" and "running_time!" are not vaild.

# The `id` column and timestamp columns are automatically added.
# Do not define those columns yourself.

# What table do you need to store the necessary information?
# What columns do you need in that table?

DB.define_table("quarterbacks")
DB.define_column("quarterbacks", "quarterback_name", "string")
DB.define_column("quarterbacks", "claim_to_fame", "string")

DB.define_table("games")
DB.define_column("games", "player_a_id", "integer")
DB.define_column("games", "player_b_id", "integer")
DB.define_column("games", "winner", "string")
DB.define_column("games", "loser", "string")

DB.define_table("results")
DB.define_column("results", "quarterback_id", "integer")
DB.define_column("results", "quarterback_name", "string")
DB.define_column("results", "wins", "integer")

DB.define_table("tiebreakers")
DB.define_column("tiebreakers", "player_a", "string")
DB.define_column("tiebreakers", "player_b", "string")
DB.define_column("tiebreakers", "tiebreaker_wins", "integer")