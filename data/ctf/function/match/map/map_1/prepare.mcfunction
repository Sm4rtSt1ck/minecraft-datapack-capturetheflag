say match/map/map_1/prepare

title @s title {"text": "Map 1", "color": "blue"}

forceload add -98 43 -44 102
forceload add -200 -200 -100 -100

# Clone the map
schedule function ctf:match/map/map_1/clone 1s
