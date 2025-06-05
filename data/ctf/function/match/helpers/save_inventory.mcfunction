execute positioned as @s run summon chest_minecart ~ -100 ~ {NoGravity: true, Invulnerable: true, Tags: ["inventory", "just_summoned"]}

execute positioned as @s run scoreboard players operation @n[tag=just_summoned, type=chest_minecart] player_id = @s player_id

execute positioned as @s run item replace entity @n[tag=just_summoned, tag=inventory] container.0 from entity @s hotbar.0
execute positioned as @s run item replace entity @n[tag=just_summoned, tag=inventory] container.1 from entity @s hotbar.1
execute positioned as @s run item replace entity @n[tag=just_summoned, tag=inventory] container.2 from entity @s hotbar.2
execute positioned as @s run item replace entity @n[tag=just_summoned, tag=inventory] container.3 from entity @s hotbar.3
execute positioned as @s run item replace entity @n[tag=just_summoned, tag=inventory] container.4 from entity @s hotbar.4
execute positioned as @s run item replace entity @n[tag=just_summoned, tag=inventory] container.5 from entity @s hotbar.5
execute positioned as @s run item replace entity @n[tag=just_summoned, tag=inventory] container.6 from entity @s hotbar.6
execute positioned as @s run item replace entity @n[tag=just_summoned, tag=inventory] container.7 from entity @s hotbar.7
execute positioned as @s run item replace entity @n[tag=just_summoned, tag=inventory] container.8 from entity @s weapon.offhand
execute positioned as @s run item replace entity @n[tag=just_summoned, tag=inventory] container.9 from entity @s armor.head
execute positioned as @s run item replace entity @n[tag=just_summoned, tag=inventory] container.10 from entity @s armor.chest
execute positioned as @s run item replace entity @n[tag=just_summoned, tag=inventory] container.11 from entity @s armor.legs
execute positioned as @s run item replace entity @n[tag=just_summoned, tag=inventory] container.12 from entity @s armor.feet

execute positioned as @s run tag @n[tag=just_summoned, tag=inventory] remove just_summoned
