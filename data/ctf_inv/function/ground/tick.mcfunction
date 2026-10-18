# XP orbs (dropped on death) would change the ultimate bar of the player who picks them up
kill @e[type=experience_orb]

# New item entities are classified once (tags ctf.r.<kind>), UI items are killed
execute as @e[type=item, tag=!ctf.seen] run function ctf_inv:ground/classify

# Flag (broken banner)
execute if score game state matches 4..5 as @e[type=item, tag=ctf.r.banner] at @s run \
    data modify entity @s Owner set from entity @n[tag=!defense, tag=!ultimate] UUID
execute if score game state matches 4..5 as @e[type=item, tag=ctf.r.banner] at @s run \
    data modify entity @s Owner set from entity @n[tag=attack, tag=!ultimate] UUID

# Everything else: only a player who has a place for the item can pick it up
execute as @e[type=item, tag=ctf.r.flag] at @s run function ctf_inv:ground/own/flag
execute as @e[type=item, tag=ctf.r.main] at @s run function ctf_inv:ground/own/main
execute as @e[type=item, tag=ctf.r.sec] at @s run function ctf_inv:ground/own/sec
execute as @e[type=item, tag=ctf.r.he] at @s run function ctf_inv:ground/own/he
execute as @e[type=item, tag=ctf.r.guard] at @s run function ctf_inv:ground/own/guard
execute as @e[type=item, tag=ctf.r.arrow] at @s run function ctf_inv:ground/own/arrow
execute as @e[type=item, tag=ctf.r.off] at @s run function ctf_inv:ground/own/off
execute as @e[type=item, tag=ctf.r.free] at @s run function ctf_inv:ground/own/free
execute as @e[type=item, tag=ctf.r.regen] at @s run function ctf_inv:ground/own/regen
execute as @e[type=item, tag=ctf.r.speed] at @s run function ctf_inv:ground/own/speed
execute as @e[type=item, tag=ctf.r.chorus] at @s run function ctf_inv:ground/own/chorus

tag @a remove ctf.res.flag
tag @a remove ctf.res.main
tag @a remove ctf.res.sec
tag @a remove ctf.res.he
tag @a remove ctf.res.guard
tag @a remove ctf.res.arrow
tag @a remove ctf.res.off
tag @a remove ctf.res.free
tag @a remove ctf.res.regen
tag @a remove ctf.res.speed
tag @a remove ctf.res.chorus
