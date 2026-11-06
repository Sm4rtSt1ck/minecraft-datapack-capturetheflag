# As a player: the attack routes R1..R4 (rounds won / rounds) of the map
execute store result score #r1w lrn run data get storage ctf_bots:learn cur.routes[0].w
execute store result score #r1n lrn run data get storage ctf_bots:learn cur.routes[0].n
execute store result score #r2w lrn run data get storage ctf_bots:learn cur.routes[1].w
execute store result score #r2n lrn run data get storage ctf_bots:learn cur.routes[1].n
execute store result score #r3w lrn run data get storage ctf_bots:learn cur.routes[2].w
execute store result score #r3n lrn run data get storage ctf_bots:learn cur.routes[2].n
execute store result score #r4w lrn run data get storage ctf_bots:learn cur.routes[3].w
execute store result score #r4n lrn run data get storage ctf_bots:learn cur.routes[3].n
tellraw @s [{"text": "Bots' attack routes (won / rounds): ", "color": "yellow"}, {"text": "R1 ", "color": "green"}, {"score": {"name": "#r1w", "objective": "lrn"}, "color": "white"}, {"text": "/", "color": "gray"}, {"score": {"name": "#r1n", "objective": "lrn"}, "color": "white"}, {"text": "  R2 ", "color": "yellow"}, {"score": {"name": "#r2w", "objective": "lrn"}, "color": "white"}, {"text": "/", "color": "gray"}, {"score": {"name": "#r2n", "objective": "lrn"}, "color": "white"}, {"text": "  R3 ", "color": "aqua"}, {"score": {"name": "#r3w", "objective": "lrn"}, "color": "white"}, {"text": "/", "color": "gray"}, {"score": {"name": "#r3n", "objective": "lrn"}, "color": "white"}, {"text": "  R4 ", "color": "light_purple"}, {"score": {"name": "#r4w", "objective": "lrn"}, "color": "white"}, {"text": "/", "color": "gray"}, {"score": {"name": "#r4n", "objective": "lrn"}, "color": "white"}]
