# #ctf:on/round_win: the attackers won, the flag is taken from them
execute if data storage ctf:round won{winner: "attack"} run clear @a[tag=attack] minecraft:magenta_banner
execute if data storage ctf:round won{winner: "attack"} run effect clear @a[tag=attack] minecraft:glowing
