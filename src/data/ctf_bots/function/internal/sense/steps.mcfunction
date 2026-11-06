# As an enemy player the bot tagged bk_me hears running (not seen): the team memory, unless fresher
# news of him: here, heard. News when nothing was said about him for a while
from registry:bots import TALK
tag @s add bk_who
function ctf_bots:internal/sense/intel_of
execute if score @n[type=marker, tag=bk_about] bk.age matches ..20 run return run function ctf_bots:internal/sense/done
execute at @s run tp @e[type=marker, tag=bk_about] ~ ~ ~
scoreboard players set @e[type=marker, tag=bk_about] bk.age 0
scoreboard players set @e[type=marker, tag=bk_about] bk.src 2
scoreboard players operation @e[type=marker, tag=bk_about] bk.by = #me bots
execute if score @n[type=marker, tag=bk_about] bk.said matches (f"{TALK['again'] // 2}..") as @e[type=zombified_piglin, tag=bk_me] run function ctf_bots:internal/talk/steps
function ctf_bots:internal/sense/done
