# As a bot (bk_me): which enemy it sees to fight (bot_cand): one: him; more: the least value
# (ctf_bots:internal/duel/value: near, low hp, the flag carrier, a ranged weapon, hitting it)
execute store result score #ns bots if entity @a[tag=bk_seen]
execute if score #ns bots matches ..1 run return run tag @a[tag=bk_seen] add bot_cand
scoreboard players set #best bots 1000000
execute as @a[tag=bk_seen] run function ctf_bots:internal/duel/value
tag @a[tag=bk_best] add bot_cand
tag @a remove bk_best
