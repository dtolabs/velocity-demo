   name "webserver"
    description "webserver node"
    override_attributes(
      :webserver => {:server_role => "database_master"}
    )
    run_list(
      "role[production]",
      "role[base]",
      "recipe[wordpress::webserver]"
    )

