# Every taken out reward goes back into the crate of its owner (or is dropped if there is no crate)
tag @s add ctf.stash_owner
execute as @e[type=item, tag=ctf.buf] if items entity @s contents *[custom_data~{ctf_bound:1b}] run function ctf_inv:owned/return_one
tag @s remove ctf.stash_owner
