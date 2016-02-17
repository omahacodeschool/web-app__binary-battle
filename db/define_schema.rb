require_relative "./_configure"
DB.define_table("dworves")
DB.define_column("dworves","name","string")
DB.define_column("dworves","vote","integer")