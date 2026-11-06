# As an enemy player the bot tagged bk_me sees: tag bk_seen; the team memory (his intel marker: here,
# fresh, seen, his hp and weapon, who saw him). News (unknown until now, or only heard, or nothing
# said about him for TALK "again"; or low hp now): the bot tells it. Teammates near him that don't
# face him are warned (ctf_bots:internal/sense/warn)
from registry:bots import SENSE, TALK
tag @s add bk_seen
tag @s add bk_who
function ctf_bots:internal/sense/intel_of
scoreboard players set #news bots 0
execute if score @n[type=marker, tag=bk_about] bk.age matches (f"{SENSE['forget']}..") run scoreboard players set #news bots 1
execute if score @n[type=marker, tag=bk_about] bk.src matches 2 if score @n[type=marker, tag=bk_about] bk.said matches 40.. run scoreboard players set #news bots 1
execute if score @n[type=marker, tag=bk_about] bk.said matches (f"{TALK['again']}..") run scoreboard players set #news bots 1
execute if score #news bots matches 0 if score @s health matches (f"..{SENSE['low']}") if score @n[type=marker, tag=bk_about] bk.hp matches (f"{SENSE['low'] + 1}..") run scoreboard players set #news bots 2
function ctf_bots:internal/sense/mark
execute at @s run function ctf_bots:internal/trick/heat
execute if score #news bots matches 1 as @e[type=zombified_piglin, tag=bk_me] run function ctf_bots:internal/talk/seen
execute if score #news bots matches 2 as @e[type=zombified_piglin, tag=bk_me] run function ctf_bots:internal/talk/low
execute at @s as @e[type=zombified_piglin, tag=ctf_bot, tag=!bk_me, distance=(f"..{SENSE['warn']}")] if function ctf_bots:internal/sense/same_side run function ctf_bots:internal/sense/warn
tag @e[type=marker, tag=bk_about] remove bk_about
tag @s remove bk_who
