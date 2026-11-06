# As an enemy the bot (bk_me) sees: his value = distance + hp, -40 carrying the flag, -10 a ranged
# weapon, -20 he hit the bot; the least so far gets the tag bk_best
execute at @s as @e[type=zombified_piglin, tag=bk_me] run function ctf_bots:internal/team/dist
scoreboard players operation #v bots = #dist bots
scoreboard players operation #v bots += @s health
execute if entity @s[tag=bot_flag_player] run scoreboard players remove #v bots 40
function ctf_bots:internal/sense/wpn
function ctf_bots:internal/duel/class
execute if score #eranged bots matches 1 run scoreboard players remove #v bots 10
tag @s add bk_cur
execute as @e[type=zombified_piglin, tag=bk_me] on attacker if entity @s[tag=bk_cur] run scoreboard players remove #v bots 20
tag @s remove bk_cur
execute unless score #v bots < #best bots run return 0
scoreboard players operation #best bots = #v bots
tag @a remove bk_best
tag @s add bk_best
