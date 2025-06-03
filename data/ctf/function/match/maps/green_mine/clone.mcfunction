function admin:log/function {name: "match/maps/green_mine/clone"}

# Map entities
summon minecraft:minecart -163.5 -34 -149.5 {Invulnerable:true, Tags:["map_entity"]}
summon minecraft:area_effect_cloud -135.5 -44 -126.5 {Duration:-1,Age:-2147483648,WaitTime:-2147483648,Passengers:[{id:"minecraft:chest_minecart",Invulnerable:false,Tags:["map_entity"]}],Tags:["map_entity"]}
summon minecraft:area_effect_cloud -137.5 -44 -126.5 {Duration:-1,Age:-2147483648,WaitTime:-2147483648,Passengers:[{id:"minecraft:furnace_minecart",Invulnerable:false,Tags:["map_entity"]}],Tags:["map_entity"]}

summon minecraft:armor_stand -171 -35 -170 {Marker: true, Invisible: true, Tags: ["win_trigger"]}
