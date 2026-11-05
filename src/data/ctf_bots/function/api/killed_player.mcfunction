# ctf_fight:internal/killer, as the bot that killed the player tagged ctf.victim: the victim's killer
# (death subtitle, death camera); the kill money of the bot by the weapon in its hand
scoreboard players operation @a[tag=ctf.victim, limit=1] dc.killer = @s player_id
function ctf_econ:kill
