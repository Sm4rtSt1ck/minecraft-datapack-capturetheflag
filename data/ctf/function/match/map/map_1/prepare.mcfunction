say match/map/map_1/prepare

title @s title {"text": "Map 1", "color": "blue"}

tp @a[tag=player] -69.00 -50.26 70.07

# Clone the map
schedule function ctf:match/map/map_1/clone 3s
