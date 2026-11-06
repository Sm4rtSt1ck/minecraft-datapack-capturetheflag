# As a bot: its link from the node nav.id #la nav to #lb nav passed / failed ($(f): "s" / "f"): counted by
# the points' ids (learning on, a map loaded)
execute unless score Bots_learn settings matches 1 run return 0
execute unless score #map lrn matches 1.. run return 0
data modify storage ctf_bots:learn arg set value {a: 0, b: 0, f: "s"}
$data modify storage ctf_bots:learn arg.f set value "$(f)"
execute as @e[type=marker, tag=nav_node] if score @s nav.id = #la nav store result storage ctf_bots:learn arg.a int 1 run scoreboard players get @s lrn.id
execute as @e[type=marker, tag=nav_node] if score @s nav.id = #lb nav store result storage ctf_bots:learn arg.b int 1 run scoreboard players get @s lrn.id
execute if data storage ctf_bots:learn arg{a: 0} run return 0
execute if data storage ctf_bots:learn arg{b: 0} run return 0
function ctf_bots:internal/learn/link_bot with storage ctf_bots:learn arg
