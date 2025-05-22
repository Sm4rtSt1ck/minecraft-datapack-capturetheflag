function admin:log/function {name: "match/maps/farm/freeze"}

# Fill the borders
# Way 1
fill -181 -42 -122 -181 -48 -110 minecraft:light_blue_stained_glass_pane replace air
# Way 2
fill -166 -42 -123 -181 -49 -123 minecraft:light_blue_stained_glass_pane replace air
# Way 3
fill -165 -42 -110 -165 -48 -123 minecraft:light_blue_stained_glass_pane replace air

# Attack team
# execute if score match rounds < swap rounds run spreadplayers -171 -116 1 3 under -49 false @a[team=team_1]
# execute if score match rounds >= swap rounds run spreadplayers -171 -116 1 3 under -49 false @a[team=team_2]
spreadplayers -171 -116 1 3 under -49 false @a[tag=attack]
# defense team
# execute if score match rounds < swap rounds run spreadplayers -148 -168 1 3 under -40 false @a[team=team_2]
# execute if score match rounds >= swap rounds run spreadplayers -148 -168 1 3 under -40 false @a[team=team_1]
spreadplayers -148 -168 1 3 under -40 false @a[tag=defense]
