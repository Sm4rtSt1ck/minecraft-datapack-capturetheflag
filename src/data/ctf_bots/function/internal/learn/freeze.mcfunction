# #ctf:on/freeze_start (learning on, a map loaded): every player's purchase context of this round and one
# more round of it counted (storage ctf_bots:learn buy.c<ctx>.n); the bots' deaths of the last round done;
# the first freeze of a match: the old counts fade (ctf_bots:internal/learn/decay)
execute unless score Bots_learn settings matches 1 run return 0
execute unless score #map lrn matches 1.. run return 0
execute if score #decay lrn matches 1 run function ctf_bots:internal/learn/decay
execute as @a[tag=player] run function ctf_bots:internal/learn/round_ctx
tag @e[type=marker, tag=bot_wallet] remove lrn_dead
tag @e[type=marker, tag=bot_wallet] remove lrn_moved
