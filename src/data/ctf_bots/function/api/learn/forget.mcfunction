# Everything the bots learned forgotten (all maps, the purchases); the map being played starts empty
data remove storage ctf_bots:learn maps
data remove storage ctf_bots:learn buy
data modify storage ctf_bots:learn cur set value {pts: [], links: [], next: 1, routes: [{w: 0, n: 0}, {w: 0, n: 0}, {w: 0, n: 0}, {w: 0, n: 0}]}
