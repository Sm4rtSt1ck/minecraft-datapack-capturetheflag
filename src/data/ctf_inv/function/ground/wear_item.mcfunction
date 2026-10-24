# Runs as the armor item. slot
$item replace entity @a[tag=ctf.wearer, limit=1] $(slot) from entity @s contents
execute as @a[tag=ctf.wearer, limit=1] at @s run function ctf_inv:armor/sound
kill @s
