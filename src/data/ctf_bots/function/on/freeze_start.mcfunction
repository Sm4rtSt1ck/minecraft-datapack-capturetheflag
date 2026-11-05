# #ctf:on/freeze_start (after the map spawns). Like the players: the bots alive go back to their base,
# healed, with the freeze effects; the dead ones of the last round come back (BOTS.md)
execute if score team bots matches 0 run return run function ctf_bots:on/remove

function ctf_bots:internal/spawn/missing
function ctf_bots:internal/spawn/side
execute as @e[type=husk, tag=ctf_bot_new] run function ctf_bots:internal/spawn/id
tag @e[type=husk, tag=ctf_bot_new] remove ctf_bot_new
execute as @e[type=husk, tag=ctf_bot] run function ctf_bots:internal/freeze_reset
function ctf_maps:api/call/spawn_bots
function ctf_bots:internal/count

# Defense bots: the flag is placed where one of them stands (stage 2; stage 4: annotated flag spots)
execute at @e[type=husk, tag=ctf_bot, tag=defense, sort=random, limit=1] run function ctf_flag:api/place_here
