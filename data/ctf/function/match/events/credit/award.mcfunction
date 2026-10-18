# Runs as the owner of the grenade / trap / ultimate that killed the kc.victim player

# No reward for killing yourself or a teammate
execute if entity @s[tag=kc.victim] run return 0
execute if entity @s[tag=attack] if entity @a[tag=kc.victim, tag=attack] run return 0
execute if entity @s[tag=defense] if entity @a[tag=kc.victim, tag=defense] run return 0

scoreboard players add @s kills 1
execute if score #src kc.tmp matches 1 run function ctf_econ:give {key: "kill.grenade", reason: "kill (grenade)"}
execute if score #src kc.tmp matches 2 run function ctf_econ:give {key: "kill.trap", reason: "kill (trap)"}
execute if score #src kc.tmp matches 3 run function ctf_econ:give {key: "kill.ultimate", reason: "kill (ultimate)"}

# Same feedback as a normal kill (ctf:match/events/fight/kill)
title @s title ""
title @s subtitle {"text": "KILL", "color": "red"}
execute positioned as @s run playsound entity.player.levelup ambient @s ~ ~ ~ 1 1.5
function ctf:match/events/ultimate/add_point {points: 40}
tag @s add just_killed
