# x, y, z, owner, reward_fn, reward_item
$data modify storage ctf_loot:tmp f set value {cmd: "item replace block $(x) $(y) $(z) container.13 with", owner: $(owner)}
execute if data entity @s data{reward_fn: ""} run function ctf_loot:fall/fill_item with entity @s data
execute unless data entity @s data{reward_fn: ""} run function ctf_loot:fall/fill_fn with entity @s data
