function admin:log/function {name: "match/maps/farm/round"}

# Break the borders
# Way 1
fill -181 -42 -122 -181 -48 -110 minecraft:air replace light_blue_stained_glass_pane
particle minecraft:explosion_emitter -180 -46 -116 0 2 3 0 2 normal
particle minecraft:cloud -180 -46 -116 0 2 3 0 30 normal
playsound block.end_gateway.spawn block @a -180 -46 -116 1

# Way 2
fill -166 -42 -123 -181 -49 -123 minecraft:air replace light_blue_stained_glass_pane
particle minecraft:explosion_emitter -172 -45.5 -122 3 2 0 0 2 normal
particle minecraft:cloud -172 -45.5 -122 3 2 0 0 40 normal
playsound block.end_gateway.spawn block @a -172 -45.5 -122 1
# Way 3
fill -165 -42 -110 -165 -48 -123 minecraft:air replace light_blue_stained_glass_pane
particle minecraft:explosion_emitter -165 -46 -116 0 2 3 0 2 normal
particle minecraft:cloud -165 -46 -116 0 2 3 0 30 normal
playsound block.end_gateway.spawn block @a -165 -46 -116 1
