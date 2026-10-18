function admin:log/function {name: "match/events/fight/die"}

scoreboard players set @s just_died 0

# Kill credit for grenades, traps and ultimates: the game credits nobody for them
# (creeper explosions, falling anvils, effects). A vanilla player kill has priority.
execute unless score @s kc.died matches 1.. if score @s kc.time matches 1.. run function ctf:match/events/credit/victim
scoreboard players set @s kc.died 0
scoreboard players reset @s kc.time

# execute positioned as @s run spawnpoint @s ~ ~ ~ ~
tag @s add just_died
gamemode spectator @s

tag @s add dead

title @s title {"text": "DEATH", "color": "black"}

effect give @s blindness 3 1 true

execute if entity @n[tag=just_killed] run title @s subtitle [{"selector": "@n[tag=just_killed]"}, {"text": " has ", "color": "gold"}, {"score": {"name": "@n[tag=just_killed]", "objective": "health"}, "color": "red"}, {"text": " hp left!", "color": "gold"}]
tag @n[tag=just_killed] remove just_killed

schedule function ctf:match/events/fight/tp_death_location 6t
