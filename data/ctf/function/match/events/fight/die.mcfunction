function admin:log/function {name: "match/events/fight/die"}

scoreboard players set @s just_died 0

# Kill credit for grenades, traps and ultimates: the game credits nobody for them
# (creeper explosions, falling anvils, effects). A vanilla player kill has priority.
execute unless score @s kc.died matches 1.. if score @s kc.time matches 1.. run function ctf:match/events/credit/victim
# A trap kill that the game credited to a player anyway (he also hit the victim, e.g. a piercing arrow
# through the trap into him): the loot crate task "enemy_trap" still counts for who set the trap off
execute if score @s kc.died matches 1.. if score @s kc.time matches 1.. if score @s kc.src matches 2 run function ctf:match/events/credit/trap_task
scoreboard players set @s kc.died 0
scoreboard players reset @s kc.time

tag @s add just_died
gamemode spectator @s

tag @s add dead

title @s title {"text": "DEATH", "color": "black"}

effect give @s blindness 3 1 true

# The killer of this player (dc.killer: ctf:match/events/fight/killer or the kill credit)
scoreboard players operation #k dc.tmp = @s dc.killer
execute as @a if score @s player_id = #k dc.tmp run tag @s add ctf.killer_of_victim
execute if entity @a[tag=ctf.killer_of_victim] run title @s subtitle [{"selector": "@a[tag=ctf.killer_of_victim]"}, {"text": " has ", "color": "gold"}, {"score": {"name": "@a[tag=ctf.killer_of_victim, limit=1]", "objective": "health"}, "color": "red"}, {"text": " hp left!", "color": "gold"}]
tag @a remove ctf.killer_of_victim

schedule function ctf:match/events/fight/tp_death_location 6t
