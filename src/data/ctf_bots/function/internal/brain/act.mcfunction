# As a bot thinking (ctf_bots:internal/brain/think), not climbing: its side's thinking (unless on a
# detour / going to a ladder), a gap jump, being stuck, its weapons
execute unless score @s bot.det matches 1.. unless score @s bot.clm matches 1.. if entity @s[tag=attack] run function ctf_bots:internal/brain/attack
execute unless score @s bot.det matches 1.. unless score @s bot.clm matches 1.. if entity @s[tag=defense] run function ctf_bots:internal/brain/defense
# A gap ahead: the jump armed
function ctf_bots:internal/brain/leap_scan
# Stuck on the way: a ladder to climb, a small jump; under a player it can't reach: a detour
function ctf_bots:internal/brain/stuck
# Its weapons: potions, the held weapon, a grenade, a mace jump (ctf_bots:combat)
function ctf_bots:internal/combat/think
