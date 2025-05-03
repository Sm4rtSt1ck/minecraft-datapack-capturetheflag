say match/map/map_1/freeze

# Fill the borders
# Way 1
fill -190 -48 -145 -191 -42 -145 minecraft:barrier
fill -190 -48 -146 -191 -42 -146 minecraft:light_blue_stained_glass_pane
# Way 2
fill -192 -48 -182 -192 -42 -188 minecraft:barrier
fill -193 -48 -182 -193 -42 -188 minecraft:light_blue_stained_glass_pane
# Way 3
fill -196 -48 -190 -198 -42 -190 minecraft:barrier
fill -196 -48 -189 -198 -42 -189 minecraft:light_blue_stained_glass_pane

# Attack team
execute if score match rounds < swap rounds run spreadplayers -194 -162 1 3 under -48 false @a[tag=player, team=team_1]
execute if score match rounds >= swap rounds run spreadplayers -194 -162 1 3 under -48 false @a[tag=player, team=team_2]
# defense team
execute if score match rounds >= swap rounds run spreadplayers -167 -169 1 3 under -48 false @a[tag=player, team=team_1]
execute if score match rounds < swap rounds run spreadplayers -167 -169 1 3 under -48 false @a[tag=player, team=team_2]
