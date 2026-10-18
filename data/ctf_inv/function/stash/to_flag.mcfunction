# The flag always gets slot 8: whatever lies there is pushed out
# (stick / UI -> removed, anything else -> put elsewhere by the rules)
execute if items entity @a[tag=ctf.stash_owner, limit=1] hotbar.7 stick run item replace entity @a[tag=ctf.stash_owner, limit=1] hotbar.7 with air
execute if items entity @a[tag=ctf.stash_owner, limit=1] hotbar.7 *[custom_data~{ctf_ui:{}}] run item replace entity @a[tag=ctf.stash_owner, limit=1] hotbar.7 with air
execute if items entity @a[tag=ctf.stash_owner, limit=1] hotbar.7 *[custom_data~{ctf_craft:{}}] run item replace entity @a[tag=ctf.stash_owner, limit=1] hotbar.7 with air
execute unless items entity @a[tag=ctf.stash_owner, limit=1] hotbar.7 #ctf_inv:flag_slot as @a[tag=ctf.stash_owner, limit=1] at @s run function ctf_inv:stash/push_out_slot8

function ctf_inv:stash/to {slot: "hotbar.7"}
