# As a bot shooting a melee enemy (bot_want) too near: 3 blocks away from him, else to a side, where
# it can stand (room, a floor); 1 when it goes
execute facing entity @p[tag=bot_want] feet rotated ~180 0 positioned ^ ^ ^3 if block ~ ~ ~ #ctf_bots:gap if block ~ ~1 ~ #ctf_bots:gap unless block ~ ~-1 ~ #ctf_bots:gap run return run function ctf_bots:internal/brain/lure_back
execute facing entity @p[tag=bot_want] feet rotated ~90 0 positioned ^ ^ ^3 if block ~ ~ ~ #ctf_bots:gap if block ~ ~1 ~ #ctf_bots:gap unless block ~ ~-1 ~ #ctf_bots:gap run return run function ctf_bots:internal/brain/lure_back
execute facing entity @p[tag=bot_want] feet rotated ~-90 0 positioned ^ ^ ^3 if block ~ ~ ~ #ctf_bots:gap if block ~ ~1 ~ #ctf_bots:gap unless block ~ ~-1 ~ #ctf_bots:gap run return run function ctf_bots:internal/brain/lure_back
return 0
