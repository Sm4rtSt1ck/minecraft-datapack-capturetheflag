say match/map/map_1/round

# Break the borders
# Way 1
fill -177 -49 -196 -177 -50 -198 minecraft:air
particle minecraft:explosion_emitter -176.5 -49 -196.5 0 0 0 0 1 force
playsound block.end_gateway.spawn block @a -176.5 -49 -196.5 1

# Way 2
fill -191 -36 -194 -193 -34 -194 minecraft:air
particle minecraft:explosion_emitter -191.5 -34.5 -193.5 0 0 0 0 1 force
playsound block.end_gateway.spawn block @a -191.5 -34.5 -193.5 1
