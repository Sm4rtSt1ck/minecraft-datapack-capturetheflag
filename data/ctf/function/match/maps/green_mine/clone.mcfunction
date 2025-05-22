function admin:log/function {name: "match/maps/green_mine/clone"}

# Map entities
summon minecraft:minecart -188.5 -34 -174.5 {Invulnerable:true, Tags:["map_entity"]}
summon minecraft:area_effect_cloud -160.5 -44 -151.5 {Duration:-1,Age:-2147483648,WaitTime:-2147483648,Passengers:[{id:"minecraft:chest_minecart",Invulnerable:false,Tags:["map_entity"]}],Tags:["map_entity"]}
summon minecraft:area_effect_cloud -162.5 -44 -151.5 {Duration:-1,Age:-2147483648,WaitTime:-2147483648,Passengers:[{id:"minecraft:furnace_minecart",Invulnerable:false,Tags:["map_entity"]}],Tags:["map_entity"]}
