require_relative "./_configure"
DB.define_table("dworfs")
DB.define_column("dworfs","name","string")
DB.define_column("dworfs","vote","integer")