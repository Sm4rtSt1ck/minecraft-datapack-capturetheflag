say match/map/map_2/prepare

title @s title {"text": "Green mine", "color": "blue"}

# tp @a[tag=player] 26 -45 122.5
forceload add 0 100 100 200
forceload add -200 -200 -100 -100

schedule function ctf:match/map/map_2/clone 1s
