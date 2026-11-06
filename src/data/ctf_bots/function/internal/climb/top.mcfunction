# As a climbing bot above its ladder, at its feet: a step onto the top towards the wall of the ladder
# (2 free blocks there), then it walks again (ctf_bots:internal/climb/stop)
execute if score @s bot.cdir matches 1 positioned ~ ~0.05 ~0.8 if block ~ ~ ~ #ctf_bots:gap if block ~ ~1 ~ #ctf_bots:gap run tp @s ~ ~ ~
execute if score @s bot.cdir matches 2 positioned ~ ~0.05 ~-0.8 if block ~ ~ ~ #ctf_bots:gap if block ~ ~1 ~ #ctf_bots:gap run tp @s ~ ~ ~
execute if score @s bot.cdir matches 3 positioned ~0.8 ~0.05 ~ if block ~ ~ ~ #ctf_bots:gap if block ~ ~1 ~ #ctf_bots:gap run tp @s ~ ~ ~
execute if score @s bot.cdir matches 4 positioned ~-0.8 ~0.05 ~ if block ~ ~ ~ #ctf_bots:gap if block ~ ~1 ~ #ctf_bots:gap run tp @s ~ ~ ~
function ctf_bots:internal/climb/stop
