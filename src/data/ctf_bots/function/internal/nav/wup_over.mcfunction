# As a bot above the roof it flew to: a push towards its lure (the node on it)
tag @s remove bot_wup
tag @s add bot_jumper
execute facing entity @n[type=rabbit, tag=bot_wl] feet rotated ~ 0 run summon marker ^ ^ ^1 {Tags: ["bot_vec"]}
function ctf_bots:internal/combat/motion {speed: "0.0004", entity: "zombified_piglin", tag: "bot_jumper"}
data modify entity @s Motion[1] set value 0.1d
tag @s remove bot_jumper
