say match/map/map_1/freeze

# Fill the borders
# Way 1
fill -190 -50 -146 -191 -36 -146 minecraft:light_blue_stained_glass_pane
# Way 2
fill -193 -50 -182 -193 -36 -188 minecraft:light_blue_stained_glass_pane
# Way 3
fill -196 -50 -189 -198 -36 -189 minecraft:light_blue_stained_glass_pane

# Attack team
execute if score match rounds < swap rounds run spreadplayers -194 -162 1 3 under -50 false @s[team=team_1]
execute if score match rounds >= swap rounds run spreadplayers -194 -162 1 3 under -50 false @s[team=team_2]
# defense team
execute if score match rounds >= swap rounds run spreadplayers -167 -169 1 3 under -50 false @s[team=team_1]
execute if score match rounds < swap rounds run spreadplayers -167 -169 1 3 under -50 false @s[team=team_2]
