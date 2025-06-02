function admin:log/function {name: "match/maps/farm/freeze"}

# Fill the borders
# Way 1
fill -181 -42 -122 -181 -52 -108 minecraft:light_blue_stained_glass_pane replace air
# Way 2
fill -166 -42 -122 -181 -52 -122 minecraft:light_blue_stained_glass_pane replace air
# Way 3
fill -165 -42 -108 -165 -52 -122 minecraft:light_blue_stained_glass_pane replace air
# Way 4
fill -165 -41 -122 -181 -41 -108 light_blue_stained_glass replace air

# Attack team
# execute if score match rounds < swap rounds run spreadplayers -171 -116 1 3 under -49 false @a[team=team_1]
# execute if score match rounds >= swap rounds run spreadplayers -171 -116 1 3 under -49 false @a[team=team_2]
spreadplayers -171 -116 1 3 under -49 false @s[tag=attack]
# defense team
# execute if score match rounds < swap rounds run spreadplayers -148 -168 1 3 under -40 false @a[team=team_2]
# execute if score match rounds >= swap rounds run spreadplayers -148 -168 1 3 under -40 false @a[team=team_1]
spreadplayers -148 -168 1 3 under -40 false @s[tag=defense]
