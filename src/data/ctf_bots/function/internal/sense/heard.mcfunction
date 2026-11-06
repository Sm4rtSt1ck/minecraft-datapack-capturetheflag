# As an enemy player a bot (tagged bk_me) heard shooting (ctf_bots:on/noise, #wpn bots = the weapon),
# at him: the team memory, unless fresher news of him (seen within a second): here, heard, the
# weapon; the bot tells it when nothing was said about him for a while
from registry:bots import TALK
tag @s add bk_who
scoreboard players operation #me bots = @n[type=zombified_piglin, tag=bk_me] bot.n
function ctf_bots:internal/sense/intel_of
execute if score @n[type=marker, tag=bk_about] bk.src matches 1 if score @n[type=marker, tag=bk_about] bk.age matches ..20 run scoreboard players set @n[type=marker, tag=bk_about] bk.rl 0
execute if score @n[type=marker, tag=bk_about] bk.src matches 1 if score @n[type=marker, tag=bk_about] bk.age matches ..20 run return run function ctf_bots:internal/sense/done
tp @e[type=marker, tag=bk_about] ~ ~ ~
scoreboard players set @e[type=marker, tag=bk_about] bk.age 0
scoreboard players set @e[type=marker, tag=bk_about] bk.src 2
scoreboard players operation @e[type=marker, tag=bk_about] bk.wpn = #wpn bots
# A shot: he reloads now (bk.rl: ticks since his last shot)
scoreboard players set @e[type=marker, tag=bk_about] bk.rl 0
scoreboard players operation @e[type=marker, tag=bk_about] bk.by = #me bots
execute if score @n[type=marker, tag=bk_about] bk.said matches (f"{TALK['again'] // 2}..") as @e[type=zombified_piglin, tag=bk_me] run function ctf_bots:internal/talk/heard
function ctf_bots:internal/sense/done
