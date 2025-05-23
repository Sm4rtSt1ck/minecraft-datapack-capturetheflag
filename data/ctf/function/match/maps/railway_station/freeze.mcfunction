function admin:log/function {name: "match/maps/railway_station/freeze"}

# Fill the borders
# Way 1
fill -141 -51 -109 -141 -49 -111 minecraft:light_blue_stained_glass_pane replace air

# Attack team
execute if score match rounds < swap rounds run spreadplayers -139 -110 1 1 under -49 false @a[team=team_1]
execute if score match rounds >= swap rounds run spreadplayers -139 -110 1 1 under -49 false @a[team=team_2]
# defense team
execute if score match rounds >= swap rounds run spreadplayers -186 -150 1 3 under -47 false @a[team=team_1]
execute if score match rounds < swap rounds run spreadplayers -186 -150 1 3 under -47 false @a[team=team_2]
