# Every tick, as the wallet of a marked bot: its bot gone (dead) while the mark lasts -> its killer is
# the owner of the mark (ctf_fight:api/credit/bot_victim), unless a player killed it (#vkill bots:
# vanilla kill credit, ctf_bots:internal/killed, this tick or the last one)
scoreboard players operation #me bots = @s bot.n
scoreboard players set #alive bots 0
execute as @e[type=zombified_piglin, tag=ctf_bot] if score @s bot.n = #me bots run scoreboard players set #alive bots 1
execute if score #alive bots matches 1 run scoreboard players remove @s kc.time 1
execute if score #alive bots matches 1 if score @s kc.time matches 1.. run return 0
execute if score #alive bots matches 0 if score #vkill bots matches 0 run function ctf_fight:api/credit/bot_victim
tag @s remove kc.watch
scoreboard players reset @s kc.time
