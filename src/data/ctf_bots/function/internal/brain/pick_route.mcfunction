# Round start, as an attack bot: its route (bot.r) = route (n % 4) + 1, or the next one that has
# points; 0: no route (straight to the flag). It starts at the point 1 (bot.w)
scoreboard players set @s bot.w 1
scoreboard players operation #r bots = @s bot.n
scoreboard players operation #r bots %= #4 bots
scoreboard players add #r bots 1
scoreboard players set #try bots 4
function ctf_bots:internal/brain/route_try
scoreboard players operation @s bot.r = #r bots
