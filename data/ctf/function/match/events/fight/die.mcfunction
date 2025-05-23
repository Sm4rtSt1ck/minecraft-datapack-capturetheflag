scoreboard players set @s just_died 0

# execute positioned as @s run spawnpoint @s ~ ~ ~ ~
tag @s add just_died
gamemode spectator @s

tag @s add dead

title @s title {"text": "DEATH", "color": "black"}

schedule function ctf:match/events/fight/tp_death_location 6t
