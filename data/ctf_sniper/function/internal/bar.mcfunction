# Reload progress: 20 segments
execute store result score #rmax sn.tmp run data get storage ctf_sniper:config reload
scoreboard players operation #f sn.tmp = #rmax sn.tmp
scoreboard players operation #f sn.tmp -= @s sn.reload
scoreboard players set #k sn.tmp 20
scoreboard players operation #f sn.tmp *= #k sn.tmp
scoreboard players operation #f sn.tmp /= #rmax sn.tmp
execute if score #f sn.tmp matches 0 run return run title @s actionbar [{"text": "RELOADING ", "color": "gray"}, {"text": "", "color": "gold"}, {"text": "■■■■■■■■■■■■■■■■■■■■", "color": "dark_gray"}]
execute if score #f sn.tmp matches 1 run return run title @s actionbar [{"text": "RELOADING ", "color": "gray"}, {"text": "■", "color": "gold"}, {"text": "■■■■■■■■■■■■■■■■■■■", "color": "dark_gray"}]
execute if score #f sn.tmp matches 2 run return run title @s actionbar [{"text": "RELOADING ", "color": "gray"}, {"text": "■■", "color": "gold"}, {"text": "■■■■■■■■■■■■■■■■■■", "color": "dark_gray"}]
execute if score #f sn.tmp matches 3 run return run title @s actionbar [{"text": "RELOADING ", "color": "gray"}, {"text": "■■■", "color": "gold"}, {"text": "■■■■■■■■■■■■■■■■■", "color": "dark_gray"}]
execute if score #f sn.tmp matches 4 run return run title @s actionbar [{"text": "RELOADING ", "color": "gray"}, {"text": "■■■■", "color": "gold"}, {"text": "■■■■■■■■■■■■■■■■", "color": "dark_gray"}]
execute if score #f sn.tmp matches 5 run return run title @s actionbar [{"text": "RELOADING ", "color": "gray"}, {"text": "■■■■■", "color": "gold"}, {"text": "■■■■■■■■■■■■■■■", "color": "dark_gray"}]
execute if score #f sn.tmp matches 6 run return run title @s actionbar [{"text": "RELOADING ", "color": "gray"}, {"text": "■■■■■■", "color": "gold"}, {"text": "■■■■■■■■■■■■■■", "color": "dark_gray"}]
execute if score #f sn.tmp matches 7 run return run title @s actionbar [{"text": "RELOADING ", "color": "gray"}, {"text": "■■■■■■■", "color": "gold"}, {"text": "■■■■■■■■■■■■■", "color": "dark_gray"}]
execute if score #f sn.tmp matches 8 run return run title @s actionbar [{"text": "RELOADING ", "color": "gray"}, {"text": "■■■■■■■■", "color": "gold"}, {"text": "■■■■■■■■■■■■", "color": "dark_gray"}]
execute if score #f sn.tmp matches 9 run return run title @s actionbar [{"text": "RELOADING ", "color": "gray"}, {"text": "■■■■■■■■■", "color": "gold"}, {"text": "■■■■■■■■■■■", "color": "dark_gray"}]
execute if score #f sn.tmp matches 10 run return run title @s actionbar [{"text": "RELOADING ", "color": "gray"}, {"text": "■■■■■■■■■■", "color": "gold"}, {"text": "■■■■■■■■■■", "color": "dark_gray"}]
execute if score #f sn.tmp matches 11 run return run title @s actionbar [{"text": "RELOADING ", "color": "gray"}, {"text": "■■■■■■■■■■■", "color": "gold"}, {"text": "■■■■■■■■■", "color": "dark_gray"}]
execute if score #f sn.tmp matches 12 run return run title @s actionbar [{"text": "RELOADING ", "color": "gray"}, {"text": "■■■■■■■■■■■■", "color": "gold"}, {"text": "■■■■■■■■", "color": "dark_gray"}]
execute if score #f sn.tmp matches 13 run return run title @s actionbar [{"text": "RELOADING ", "color": "gray"}, {"text": "■■■■■■■■■■■■■", "color": "gold"}, {"text": "■■■■■■■", "color": "dark_gray"}]
execute if score #f sn.tmp matches 14 run return run title @s actionbar [{"text": "RELOADING ", "color": "gray"}, {"text": "■■■■■■■■■■■■■■", "color": "gold"}, {"text": "■■■■■■", "color": "dark_gray"}]
execute if score #f sn.tmp matches 15 run return run title @s actionbar [{"text": "RELOADING ", "color": "gray"}, {"text": "■■■■■■■■■■■■■■■", "color": "gold"}, {"text": "■■■■■", "color": "dark_gray"}]
execute if score #f sn.tmp matches 16 run return run title @s actionbar [{"text": "RELOADING ", "color": "gray"}, {"text": "■■■■■■■■■■■■■■■■", "color": "gold"}, {"text": "■■■■", "color": "dark_gray"}]
execute if score #f sn.tmp matches 17 run return run title @s actionbar [{"text": "RELOADING ", "color": "gray"}, {"text": "■■■■■■■■■■■■■■■■■", "color": "gold"}, {"text": "■■■", "color": "dark_gray"}]
execute if score #f sn.tmp matches 18 run return run title @s actionbar [{"text": "RELOADING ", "color": "gray"}, {"text": "■■■■■■■■■■■■■■■■■■", "color": "gold"}, {"text": "■■", "color": "dark_gray"}]
execute if score #f sn.tmp matches 19 run return run title @s actionbar [{"text": "RELOADING ", "color": "gray"}, {"text": "■■■■■■■■■■■■■■■■■■■", "color": "gold"}, {"text": "■", "color": "dark_gray"}]
execute if score #f sn.tmp matches 20 run return run title @s actionbar [{"text": "RELOADING ", "color": "gray"}, {"text": "■■■■■■■■■■■■■■■■■■■■", "color": "gold"}, {"text": "", "color": "dark_gray"}]
