# #ctf:on/match_ending (before the arena is cleaned; also a match left by everyone): what the bots learned
# on this map is saved (ctf_bots:internal/learn/save), no map loaded any more
function ctf_bots:internal/learn/save
scoreboard players set #map lrn 0
