function admin:log/function {name: "match/maps/railway_station/round"}

# Break the borders
# Way 1
fill -141 -51 -109 -141 -49 -111 minecraft:air replace light_blue_stained_glass_pane
particle minecraft:explosion -140.5 -49.5 -109.5 0.2 0.3 0.3 1 3 normal
particle minecraft:cloud -140.5 -49.5 -109.5 0.2 0.3 0.3 0 10 normal
playsound block.end_gateway.spawn block @a -140.5 -49.5 -109.5 1
