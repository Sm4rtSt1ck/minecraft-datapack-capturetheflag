say match/map/map_1/prepare

title @s title {"text": "Green mine", "color": "blue"}

tp @a[tag=player] 26 -45 122.5

# Clone the map
kill @e[tag=map_entity]
clone 0 -52 100 25 -21 126 -200 -52 -200
clone 25 -21 126 50 -52 150 -175 -52 -174
clone 26 -52 100 50 -21 126 -174 -52 -200
clone 25 -21 127 0 -52 150 -200 -52 -173
summon minecraft:minecart -188.5 -34 -174.5 {Invulnerable:true, Tags:["map_entity"]}
