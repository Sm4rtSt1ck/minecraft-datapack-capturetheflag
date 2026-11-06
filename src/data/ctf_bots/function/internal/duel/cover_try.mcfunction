# As a node near a bot hiding from the sniper (intel bk_snp): he can't see it (a ray from his place to
# 1.6 above it is blocked)? Then it is the bot's cover (bot.cvn = its id, #found bots 1)
scoreboard players set #los bots 0
scoreboard players set #step bots 0
tag @s add bk_cov
execute at @n[type=marker, tag=bk_snp] positioned ~ ~1.6 ~ facing entity @s feet run function ctf_bots:internal/duel/hide_ray
tag @s remove bk_cov
execute if score #los bots matches 1 run return 0
scoreboard players set #found bots 1
scoreboard players operation @e[type=zombified_piglin, tag=bk_me] bot.cvn = @s nav.id
