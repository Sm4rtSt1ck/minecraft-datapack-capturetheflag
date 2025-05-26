execute if score game state matches 2..5 run playsound minecraft:music_disc.chirp master @a[tag=!lobby] -164.5 999 -127.5 70 1

execute if score game state matches 2..5 run schedule function ctf:match/maps/green_mine/music 3700t
