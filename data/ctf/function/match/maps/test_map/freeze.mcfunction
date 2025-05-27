function admin:log/function {name: "match/maps/test_map/freeze"}

# Fill the borders
# Way 1
fill -190 -50 -146 -191 -36 -146 minecraft:light_blue_stained_glass_pane replace air
# Way 2
fill -193 -50 -182 -193 -36 -188 minecraft:light_blue_stained_glass_pane replace air
# Way 3
fill -196 -50 -189 -198 -36 -189 minecraft:light_blue_stained_glass_pane replace air

# Attack team
# execute if score match rounds < swap rounds run spreadplayers -194 -162 1 3 under -50 false @a[team=team_1]
# execute if score match rounds >= swap rounds run spreadplayers -194 -162 1 3 under -50 false @a[team=team_2]
spreadplayers -194 -162 1 3 under -50 false @s[tag=attack]
# defense team
# execute if score match rounds >= swap rounds run spreadplayers -167 -169 1 3 under -50 false @a[team=team_1]
# execute if score match rounds < swap rounds run spreadplayers -167 -169 1 3 under -50 false @a[team=team_2]
spreadplayers -167 -169 1 3 under -50 false @s[tag=defense]
