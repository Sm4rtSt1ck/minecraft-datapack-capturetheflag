# A block up while it is free; the first block that isn't: the anvil goes right under it
scoreboard players add #cu lrn 1
execute if score #cu lrn matches 9.. run return 0
execute unless block ~ ~1 ~ #ctf_bots:gap run return run summon marker ~ ~ ~ {Tags: ["bot_pick", "lrn_tmp"]}
execute positioned ~ ~1 ~ run function ctf_bots:internal/learn/ceiling_up
