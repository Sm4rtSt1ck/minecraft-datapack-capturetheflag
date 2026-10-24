function admin:log/function {name: "match/maps/green_mine/freeze"}

# Fill the borders
# Way 1
fill -152 -49 -171 -152 -50 -173 minecraft:lime_stained_glass_pane replace air
# Way 2
fill -166 -36 -169 -168 -34 -169 minecraft:lime_stained_glass_pane replace air

# Attack team
# execute if score match rounds < swap rounds run spreadplayers -195 -197 1 2 under -36 false @a[team=team_1]
# execute if score match rounds >= swap rounds run spreadplayers -195 -197 1 2 under -36 false @a[team=team_2]
spreadplayers -170 -172 1 2 under -36 false @s[tag=attack]
# defense team
# execute if score match rounds >= swap rounds run spreadplayers -161 -157 1 2 under -41 false @a[team=team_1]
# execute if score match rounds < swap rounds run spreadplayers -161 -157 1 2 under -41 false @a[team=team_2]
spreadplayers -136 -132 1 2 under -41 false @s[tag=defense]
