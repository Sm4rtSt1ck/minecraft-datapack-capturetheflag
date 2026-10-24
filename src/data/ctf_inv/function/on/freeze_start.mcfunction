# #ctf:on/freeze_start (before the shop opens)
scoreboard players reset * bow_used
scoreboard players reset * xbow_used

# Body armor: the team leather set for players without a set (ctf_inv:armor)
execute as @a[tag=player] at @s run function ctf_inv:armor/freeze_default

execute as @a[tag=player] unless items entity @s container.* *[custom_data~{tags:["main weapon"]}] unless items entity @s weapon.offhand *[custom_data~{tags:["main weapon"]}] run \
    give @s golden_sword[enchantments={knockback:2b, sweeping_edge:3b}, custom_data={tags:["main weapon"], bind:1b, wpn:"golden_sword"}]
