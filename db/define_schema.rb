require_relative "./_configure"

DB.define_table("final_fantasy_games")
DB.define_column("final_fantasy_games", "game_title", "string")
DB.define_column("final_fantasy_games", "game_cover", "string")

