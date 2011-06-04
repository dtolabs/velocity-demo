name "rackspacedemo"
description "simple blog app"
run_list(
  "role[production]",
  "role[base]",
  "recipe[wordpress]"
)

