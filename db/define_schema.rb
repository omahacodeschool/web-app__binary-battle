require_relative "./_configure"
DB.define_table("dworves")
DB.define_column("dworves","name","string")
DB.define_column("dworves","vote","integer")
DB.define_column("dworves","image","string")

DB.define_table("results")
DB.define_column("results","win","integer")
DB.define_column("results","loose","integer")