# Advancement reward: runs every tick while the right mouse button is held with the rifle
# (rf.cd: fire rate, see ctf_guns:tick)
advancement revoke @s only ctf_guns:rifle_use
scoreboard players set @s rf.hold 2

execute unless score game state = round state unless score game state = end_round state run return run title @s actionbar {"text": "You can't shoot now", "color": "red"}
execute if score @s rf.reload matches 1.. run return 0
execute if score @s rf.cd matches 1.. run return 0
execute unless score @s rf.mag matches 1.. run return run function ctf_guns:rifle/start_reload
function ctf_guns:rifle/shoot
