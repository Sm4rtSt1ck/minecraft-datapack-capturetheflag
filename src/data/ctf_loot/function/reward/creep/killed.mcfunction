# Who killed the creeper (melee, arrows, bullets: the last player who hurt it)
scoreboard players reset #owner kc.tmp
execute as @e[type=creeper, tag=loot.creeper_mine, limit=1] on attacker if entity @s[type=player] run scoreboard players operation #owner kc.tmp = @s player_id
tag @e[type=creeper, tag=loot.creeper_mine] remove loot.creeper
tag @e[type=creeper, tag=loot.creeper_mine] remove loot.creeper_mine
function ctf_loot:reward/creep/die {src: 6}
