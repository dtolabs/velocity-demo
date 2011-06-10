name "base"
description "Base role applied to all nodes."
    override_attributes(
      "munin" => {"server_role" => "datacollect"},
      "chef_client" => {"client_interval" => "300"},
      "chef_client" => {"init_style" => "runit"}
    )
   run_list(
      "recipe[apt]",
      "recipe[users::sysadmins]",
      "recipe[sudo]",
      "recipe[tools]",
      "recipe[motd]",
      "recipe[chef-client::service]",
      "recipe[nagios::client]",
      "recipe[munin::client]",
      "recipe[noah]"
)
