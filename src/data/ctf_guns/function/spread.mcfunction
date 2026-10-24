# Random yaw / pitch within +-#s gun.tmp tenths of a degree -> storage ctf_guns:shot
data modify storage ctf_guns:shot yaw set value 0f
data modify storage ctf_guns:shot pitch set value 0f
execute if score #s gun.tmp matches ..0 run return 0
scoreboard players operation #ns gun.tmp = #s gun.tmp
scoreboard players set #k gun.tmp -1
scoreboard players operation #ns gun.tmp *= #k gun.tmp
execute store result storage ctf_guns:range min int 1 run scoreboard players get #ns gun.tmp
execute store result storage ctf_guns:range max int 1 run scoreboard players get #s gun.tmp
function ctf_guns:spread_roll with storage ctf_guns:range
