   name "database_master"
    description "database master node"
    run_list(
      "role[production]",
      "role[base]",
      "recipe[wordpress::database_master]"
    )

