say match/map/map_2/clone

# Clone the map
kill @e[tag=map_entity]
clone 0 -52 100 25 -21 126 -200 -52 -200
clone 25 -21 126 50 -52 150 -175 -52 -174
clone 26 -52 100 50 -21 126 -174 -52 -200
clone 25 -21 127 0 -52 150 -200 -52 -173

kill @e[type=item]

# Map entities
summon minecraft:minecart -188.5 -34 -174.5 {Invulnerable:true, Tags:["map_entity"]}
summon minecraft:area_effect_cloud -160.5 -44 -151.5 {Duration:-1,Age:-2147483648,WaitTime:-2147483648,Passengers:[{id:"minecraft:chest_minecart",Invulnerable:false,Tags:["map_entity"]}],Tags:["map_entity"]}
summon minecraft:area_effect_cloud -162.5 -44 -151.5 {Duration:-1,Age:-2147483648,WaitTime:-2147483648,Passengers:[{id:"minecraft:furnace_minecart",Invulnerable:false,Tags:["map_entity"]}],Tags:["map_entity"]}

forceload remove all
