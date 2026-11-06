# A defense bot at its spot: it stands asleep (NoAI: no swinging at its lure) until something happens
execute if entity @s[tag=bot_guard] run return 0
data merge entity @s {NoAI: 1b}
tag @s add bot_guard
