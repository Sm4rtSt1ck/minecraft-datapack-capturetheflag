function admin:log/function {name: "match/maps/night_club/round"}

# Break the borders
# Way 1
fill -182 -50 -157 -180 -48 -157 minecraft:air replace minecraft:light_blue_stained_glass_pane
particle minecraft:explosion -180.5 -48.5 -156.5 0.5 0.5 0.5 0 10 normal
particle minecraft:cloud -180.5 -48.5 -156.5 0.5 0.5 0.5 0 20 normal
playsound block.end_gateway.spawn block @a -176.5 -48.5 -196.5 1

# Way 2
fill -180 -50 -149 -183 -48 -149 minecraft:air replace minecraft:light_blue_stained_glass_pane
particle minecraft:explosion -181 -48.5 -148.5 0.5 0.5 0.5 0 10 normal
particle cloud -181 -48.5 -148.5 1 0.5 1 0.1 30 normal
playsound block.end_gateway.spawn block @a -181 -48.5 -148.5 1


fill -188 -52 -158 -177 -48 -158 minecraft:air replace minecraft:light_blue_stained_glass_pane
fill -177 -48 -157 -177 -52 -149 minecraft:air replace minecraft:light_blue_stained_glass_pane
fill -178 -52 -148 -188 -48 -148 minecraft:air replace minecraft:light_blue_stained_glass_pane
fill -177 -47 -158 -187 -47 -148 minecraft:air replace minecraft:light_blue_stained_glass
