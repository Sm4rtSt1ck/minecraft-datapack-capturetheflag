# Only one item from the group can be owned
# ("main weapon", "secondary weapon", "he_grenade", "shield or totem").
# The bought item gets custom_data={tags:["<group>"], bind:<bind>}. Returns 1 on success, 0 otherwise.
# item, name, components, count, cost, group
# bind:    1b - the item has its own hotbar slot (ctf_inv), 0b - free slot / offhand
# offhand: 1 - goes into the offhand if it's empty
# free:    1 - needs a free hotbar slot (4-6) when not going into the offhand
$execute unless score @s money matches $(cost).. run return run function ctf_shop:feedback/no_money

# The default golden sword is replaced by a bought main weapon
$clear @s golden_sword[custom_data~{tags:["$(group)"]}]

$execute if items entity @s container.* *[custom_data~{tags:["$(group)"]}] run return run function ctf_shop:feedback/limit {group: "$(group)"}
$execute if items entity @s weapon.offhand *[custom_data~{tags:["$(group)"]}] run return run function ctf_shop:feedback/limit {group: "$(group)"}
$execute if items entity @s player.crafting.* *[custom_data~{tags:["$(group)"]}] run return run function ctf_shop:feedback/limit {group: "$(group)"}
$execute store result score #ok shop.tmp run function ctf_shop:internal/space {offhand: $(offhand), free: $(free)}
execute if score #ok shop.tmp matches 0 run return run function ctf_shop:feedback/no_space

$execute if score #off shop.tmp matches 1 run item replace entity @s weapon.offhand with $(item)[custom_name='$(name)', custom_data={tags:["$(group)"], bind:$(bind)}, $(components)] $(count)
$execute if score #off shop.tmp matches 0 run give @s $(item)[custom_name='$(name)', custom_data={tags:["$(group)"], bind:$(bind)}, $(components)] $(count)
$scoreboard players remove @s money $(cost)
function ctf_shop:feedback/bought
return 1
