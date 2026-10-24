# Advancement reward: a player was killed by a direct hit of a flying wind charge
advancement revoke @s only ctf_loot:wind_kill
execute if entity @s[scores={tk.red=1..}] run return 0
function ctf_loot:task {id: "wind"}
