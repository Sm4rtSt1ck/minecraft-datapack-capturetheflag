# The coordinates: registry/world.bolt
from registry:world import LOBBY

#########################################
# TELEPORT

execute in minecraft:overworld run tp @s (LOBBY["spawn"][0]) (LOBBY["spawn"][1]) (LOBBY["spawn"][2]) (LOBBY["spawn_rotation"][0]) (LOBBY["spawn_rotation"][1])
spreadplayers (LOBBY["spread"][0]) (LOBBY["spread"][1]) 1 1 under (LOBBY["spread_under"]) false @s

#########################################
# TAGS

tag @s add lobby
tag @s remove player
tag @s remove spectator
tag @s remove attack
tag @s remove defense
tag @s remove dead
# DON'T REMOVE THE LINE BELOW
tag @s remove bomber
tag @s remove just_used_totem
tag @s remove just_died
tag @s remove just_killed

#########################################
# OTHER PLAYER SETTINGS

# The ultimate, the death camera and the Creepenator creeper stop
function #ctf:on/player_reset
# ONLY AFTER ULTIMATE STOPPING (#ctf:on/player_reset)
clear @s
team join lobby @s
gamemode adventure @s
execute positioned as @s run spawnpoint @s

#########################################
# EFFECTS

effect clear @s
effect give @s minecraft:regeneration 1 127 true
effect give @s minecraft:resistance infinite 127 true
effect give @s minecraft:jump_boost infinite 1 true
effect give @s minecraft:speed infinite 0 true
effect give @s minecraft:saturation infinite 127 true

#########################################
# OTHER

stopsound @s
execute if score Music settings matches 1 run playsound minecraft:music_disc.relic ambient @s (LOBBY["music"][0]) (LOBBY["music"][1]) (LOBBY["music"][2]) 70 2
execute at @s run playsound entity.firework_rocket.launch ambient @s ~ ~ ~ 1 1
execute at @s run particle minecraft:firework ~ ~1 ~ 0.1 0.1 0.1 0.07 15 normal
