# Runs every tick while reloading. Switching away from the rifle cancels the reload
execute unless items entity @s weapon.mainhand *[custom_data~{wpn:"rifle"}] run return run scoreboard players reset @s rf.reload
scoreboard players remove @s rf.reload 1
execute if score @s rf.reload matches ..0 run return run function ctf_guns:rifle/reload_done

# Progress bar: 20 segments
execute store result score #rmax gun.tmp run data get storage ctf_guns:config rifle_reload
scoreboard players operation #f gun.tmp = #rmax gun.tmp
scoreboard players operation #f gun.tmp -= @s rf.reload
scoreboard players set #k gun.tmp 20
scoreboard players operation #f gun.tmp *= #k gun.tmp
scoreboard players operation #f gun.tmp /= #rmax gun.tmp
execute if score #f gun.tmp matches 0 run return run title @s actionbar [{"text": "RELOADING ", "color": "gray"}, {"text": "", "color": "yellow"}, {"text": "■■■■■■■■■■■■■■■■■■■■", "color": "dark_gray"}]
execute if score #f gun.tmp matches 1 run return run title @s actionbar [{"text": "RELOADING ", "color": "gray"}, {"text": "■", "color": "yellow"}, {"text": "■■■■■■■■■■■■■■■■■■■", "color": "dark_gray"}]
execute if score #f gun.tmp matches 2 run return run title @s actionbar [{"text": "RELOADING ", "color": "gray"}, {"text": "■■", "color": "yellow"}, {"text": "■■■■■■■■■■■■■■■■■■", "color": "dark_gray"}]
execute if score #f gun.tmp matches 3 run return run title @s actionbar [{"text": "RELOADING ", "color": "gray"}, {"text": "■■■", "color": "yellow"}, {"text": "■■■■■■■■■■■■■■■■■", "color": "dark_gray"}]
execute if score #f gun.tmp matches 4 run return run title @s actionbar [{"text": "RELOADING ", "color": "gray"}, {"text": "■■■■", "color": "yellow"}, {"text": "■■■■■■■■■■■■■■■■", "color": "dark_gray"}]
execute if score #f gun.tmp matches 5 run return run title @s actionbar [{"text": "RELOADING ", "color": "gray"}, {"text": "■■■■■", "color": "yellow"}, {"text": "■■■■■■■■■■■■■■■", "color": "dark_gray"}]
execute if score #f gun.tmp matches 6 run return run title @s actionbar [{"text": "RELOADING ", "color": "gray"}, {"text": "■■■■■■", "color": "yellow"}, {"text": "■■■■■■■■■■■■■■", "color": "dark_gray"}]
execute if score #f gun.tmp matches 7 run return run title @s actionbar [{"text": "RELOADING ", "color": "gray"}, {"text": "■■■■■■■", "color": "yellow"}, {"text": "■■■■■■■■■■■■■", "color": "dark_gray"}]
execute if score #f gun.tmp matches 8 run return run title @s actionbar [{"text": "RELOADING ", "color": "gray"}, {"text": "■■■■■■■■", "color": "yellow"}, {"text": "■■■■■■■■■■■■", "color": "dark_gray"}]
execute if score #f gun.tmp matches 9 run return run title @s actionbar [{"text": "RELOADING ", "color": "gray"}, {"text": "■■■■■■■■■", "color": "yellow"}, {"text": "■■■■■■■■■■■", "color": "dark_gray"}]
execute if score #f gun.tmp matches 10 run return run title @s actionbar [{"text": "RELOADING ", "color": "gray"}, {"text": "■■■■■■■■■■", "color": "yellow"}, {"text": "■■■■■■■■■■", "color": "dark_gray"}]
execute if score #f gun.tmp matches 11 run return run title @s actionbar [{"text": "RELOADING ", "color": "gray"}, {"text": "■■■■■■■■■■■", "color": "yellow"}, {"text": "■■■■■■■■■", "color": "dark_gray"}]
execute if score #f gun.tmp matches 12 run return run title @s actionbar [{"text": "RELOADING ", "color": "gray"}, {"text": "■■■■■■■■■■■■", "color": "yellow"}, {"text": "■■■■■■■■", "color": "dark_gray"}]
execute if score #f gun.tmp matches 13 run return run title @s actionbar [{"text": "RELOADING ", "color": "gray"}, {"text": "■■■■■■■■■■■■■", "color": "yellow"}, {"text": "■■■■■■■", "color": "dark_gray"}]
execute if score #f gun.tmp matches 14 run return run title @s actionbar [{"text": "RELOADING ", "color": "gray"}, {"text": "■■■■■■■■■■■■■■", "color": "yellow"}, {"text": "■■■■■■", "color": "dark_gray"}]
execute if score #f gun.tmp matches 15 run return run title @s actionbar [{"text": "RELOADING ", "color": "gray"}, {"text": "■■■■■■■■■■■■■■■", "color": "yellow"}, {"text": "■■■■■", "color": "dark_gray"}]
execute if score #f gun.tmp matches 16 run return run title @s actionbar [{"text": "RELOADING ", "color": "gray"}, {"text": "■■■■■■■■■■■■■■■■", "color": "yellow"}, {"text": "■■■■", "color": "dark_gray"}]
execute if score #f gun.tmp matches 17 run return run title @s actionbar [{"text": "RELOADING ", "color": "gray"}, {"text": "■■■■■■■■■■■■■■■■■", "color": "yellow"}, {"text": "■■■", "color": "dark_gray"}]
execute if score #f gun.tmp matches 18 run return run title @s actionbar [{"text": "RELOADING ", "color": "gray"}, {"text": "■■■■■■■■■■■■■■■■■■", "color": "yellow"}, {"text": "■■", "color": "dark_gray"}]
execute if score #f gun.tmp matches 19 run return run title @s actionbar [{"text": "RELOADING ", "color": "gray"}, {"text": "■■■■■■■■■■■■■■■■■■■", "color": "yellow"}, {"text": "■", "color": "dark_gray"}]
execute if score #f gun.tmp matches 20 run return run title @s actionbar [{"text": "RELOADING ", "color": "gray"}, {"text": "■■■■■■■■■■■■■■■■■■■■", "color": "yellow"}, {"text": "", "color": "dark_gray"}]
