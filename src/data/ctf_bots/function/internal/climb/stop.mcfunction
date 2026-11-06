# As a climbing bot: it walks again (AI on), no new ladder search for 2 s; its lure moves a little
# (back at the next think): the mob plans its path again from here
tag @s remove bot_climb
data merge entity @s {NoAI: 0b}
scoreboard players set @s bot.stk 0
scoreboard players set @s bot.clw 8
scoreboard players operation #jn bots = @s bot.n
execute as @e[type=rabbit, tag=bot_lure] if score @s bot.own = #jn bots at @s run tp @s ~ ~1.5 ~
