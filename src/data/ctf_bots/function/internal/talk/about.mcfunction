# The chat values of the intel marker tagged bk_about: its block, the weapon name; the news is said
execute as @e[type=marker, tag=bk_about] run function ctf_bots:internal/talk/pos
scoreboard players operation #wpn bots = @n[type=marker, tag=bk_about] bk.wpn
function ctf_bots:internal/talk/wpn_name
scoreboard players set @e[type=marker, tag=bk_about] bk.said 0
