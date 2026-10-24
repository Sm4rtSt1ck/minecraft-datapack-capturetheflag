function admin:log/function {name: "match/maps/test_map/round"}

# Break the borders
# Way 1
fill -190 -51 -146 -193 -36 -146 minecraft:air replace light_blue_stained_glass_pane
particle minecraft:explosion_emitter -190 -42.5 -145.5 0 5 0 1 3 normal
particle minecraft:cloud -190 -42.5 -145.5 2 5 1 0 30 normal
playsound block.end_gateway.spawn block @a -190 -42.5 -145.5 1

# Way 2
fill -193 -51 -182 -193 -36 -188 minecraft:air replace light_blue_stained_glass_pane
particle minecraft:explosion_emitter -192.5 -43.5 -184.5 0 5 1 1 6 normal
particle minecraft:cloud -192.5 -43.5 -184.5 1 5 3 0 40 normal
playsound block.end_gateway.spawn block @a -192.5 -43.5 -184.5 1
# Way 3
fill -193 -51 -189 -199 -36 -189 minecraft:air replace light_blue_stained_glass_pane
particle minecraft:explosion_emitter -196.5 -43.5 -188.5 0 5 0 1 3 normal
particle minecraft:cloud -196.5 -43.5 -188.5 2 5 1 0 30 normal
playsound block.end_gateway.spawn block @a -196.5 -43.5 -188.5 1

fill -193 -35 -181 -190 -51 -181 minecraft:air replace light_blue_stained_glass_pane
fill -189 -36 -146 -189 -51 -149 minecraft:air replace light_blue_stained_glass_pane
