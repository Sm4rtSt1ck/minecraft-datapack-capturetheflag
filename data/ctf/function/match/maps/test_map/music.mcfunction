execute if score game state matches 2..5 run playsound minecraft:music_disc.creator master @a[tag=!lobby] -164.5 999 -127.5 70 2

execute if score game state matches 2..5 run schedule function ctf:match/maps/test_map/music 1760
