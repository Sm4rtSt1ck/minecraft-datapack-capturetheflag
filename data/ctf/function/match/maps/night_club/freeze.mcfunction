say match/maps/night_club/freeze

# Fill the borders
# Way 1
fill -182 -50 -157 -180 -48 -157 minecraft:light_blue_stained_glass_pane replace air
# Way 2
fill -180 -50 -149 -183 -48 -149 minecraft:light_blue_stained_glass_pane replace air

# Attack team
execute if score match rounds < swap rounds run spreadplayers -181 -152.5 1 2 under -49 false @s[team=team_1]
execute if score match rounds >= swap rounds run spreadplayers -181 -152.5 1 2 under -49 false @s[team=team_2]
# defense team
execute if score match rounds >= swap rounds run spreadplayers -138.5 -115.5 1 2 under -42 false @s[team=team_1]
execute if score match rounds < swap rounds run spreadplayers -138.5 -115.5 1 2 under -42 false @s[team=team_2]
