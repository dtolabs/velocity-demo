   name "database_slave"
    description "database slave node"
    run_list(
      "role[production]",
      "role[base]",
      "recipe[wordpress::database_master]"
    )

