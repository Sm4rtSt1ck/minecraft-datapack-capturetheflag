function admin:log/function {name: "match/maps/green_mine/round"}

# Break the borders
# Way 1
fill -152 -49 -171 -152 -50 -173 minecraft:air
particle minecraft:explosion_emitter -151.5 -49 -171.5 0 0 0 0 1 normal
particle minecraft:cloud -151.5 -49 -171.5 1 1 1 0 10 normal
playsound block.end_gateway.spawn block @a -151.5 -49 -171.5 1

# Way 2
fill -166 -36 -169 -168 -34 -169 minecraft:air
particle minecraft:explosion_emitter -166.5 -34.5 -168.5 0 0 0 0 1 normal
particle minecraft:cloud -166.5 -34.5 -168.5 1 1 1 0 10 normal
playsound block.end_gateway.spawn block @a -166.5 -34.5 -168.5 1
