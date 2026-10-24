execute if items entity @s hotbar.7 magenta_banner run function ctf_inv:api/stash {slot: "hotbar.7"}
execute if items entity @s player.cursor magenta_banner run function ctf_inv:api/stash {slot: "player.cursor"}
tag @s add ctf.stash_owner
execute as @e[type=item, tag=ctf.buf] run function ctf_inv:stash/drop
tag @s remove ctf.stash_owner
