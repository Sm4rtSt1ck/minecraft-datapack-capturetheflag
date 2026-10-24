# Runs as a hurt trap marker. Its kills are credited (ctf:match/events/credit) to the player who just
# set it off: the shooter (traps/shot) or the owner of an explosion that hit it (grenade, another trap,
# ultimate: credit/mark_traps). Otherwise (fire...) to the player who placed it
execute if score @s kc.time matches 1.. run scoreboard players operation @s kc.owner = @s kc.by
# The detector (attackers) can't go off: it is removed
execute if entity @s[tag=trap.detector] run return run kill @s
function ctf:match/events/traps/trigger
