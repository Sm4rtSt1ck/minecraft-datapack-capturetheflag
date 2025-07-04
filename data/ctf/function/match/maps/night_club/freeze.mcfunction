function admin:log/function {name: "match/maps/night_club/freeze"}

# Fill the borders
# Way 1
fill -182 -50 -157 -180 -48 -157 minecraft:light_blue_stained_glass_pane replace air
# Way 2
fill -180 -50 -149 -183 -48 -149 minecraft:light_blue_stained_glass_pane replace air

fill -177 -48 -157 -184 -52 -149 air replace lava
fill -188 -52 -158 -177 -48 -158 minecraft:light_blue_stained_glass_pane replace air
fill -177 -48 -157 -177 -52 -149 minecraft:light_blue_stained_glass_pane replace air
fill -178 -52 -148 -188 -48 -148 minecraft:light_blue_stained_glass_pane replace air
fill -177 -47 -158 -187 -47 -148 minecraft:light_blue_stained_glass replace air


# Attack team
# execute if score match rounds < swap rounds run spreadplayers -181 -152.5 1 2 under -49 false @a[team=team_1]
# execute if score match rounds >= swap rounds run spreadplayers -181 -152.5 1 2 under -49 false @a[team=team_2]
spreadplayers -181 -152.5 1 2 under -49 false @s[tag=attack]
# defense team
# execute if score match rounds >= swap rounds run spreadplayers -138.5 -115.5 1 2 under -42 false @a[team=team_1]
# execute if score match rounds < swap rounds run spreadplayers -138.5 -115.5 1 2 under -42 false @a[team=team_2]
spreadplayers -138.5 -115.5 1 2 under -42 false @s[tag=defense]
