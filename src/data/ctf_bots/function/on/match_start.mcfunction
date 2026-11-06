# #ctf:on/match_start: the learned counts of the map fade once this match, when the game itself starts
# (ctf_bots:internal/learn/freeze at the first freeze: no decay at the warm-up or at a swap clone)
scoreboard players set #decay lrn 1
