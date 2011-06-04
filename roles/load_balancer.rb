   name "load_balancer"
    description "load balancer"
    override_attributes(
      :haproxy => {:app_server_role => "webserver"},
      :haproxy => {:member_port => "80"}
    )
    run_list(
      "role[production]",
      "role[base]",
      "recipe[haproxy::app_lb]"
    )

