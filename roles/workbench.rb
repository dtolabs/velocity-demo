name "workbench"
  description "workbench and tools node"
  run_list(
    "role[production]",
    "role[base]",
    "recipe[rundeck]",
    "recipe[rundeck::knifeDTO]",
    "recipe[rundeck::chefdeck]"
  )


