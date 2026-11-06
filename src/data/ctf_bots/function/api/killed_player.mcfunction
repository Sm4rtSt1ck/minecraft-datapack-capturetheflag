# ctf_fight:internal/killer, as the bot that killed the player tagged ctf.victim: the victim's killer
# (death subtitle, death camera); the kill money of the bot by the weapon in its hand
scoreboard players operation @a[tag=ctf.victim, limit=1] dc.killer = @s player_id
function ctf_econ:kill
function ctf_bots:internal/score/kill
function ctf_bots:internal/money/flush
# What the bots learn: a kill from this place (learning on: the point within 6, lrn.dk)
execute if score Bots_learn settings matches 1 if score #map lrn matches 1.. at @s as @n[type=marker, tag=lrn_pt, distance=..6] run scoreboard players add @s lrn.dk 10
