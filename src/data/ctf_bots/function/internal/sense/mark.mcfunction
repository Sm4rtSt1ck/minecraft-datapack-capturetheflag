# As an enemy player seen (his intel marker tagged bk_about): the memory of him now: here, fresh, seen,
# his hp (the health score) and weapon, who saw him (#me bots)
function ctf_bots:internal/sense/wpn
execute at @s run tp @e[type=marker, tag=bk_about] ~ ~ ~
scoreboard players set @e[type=marker, tag=bk_about] bk.age 0
scoreboard players set @e[type=marker, tag=bk_about] bk.src 1
scoreboard players operation @e[type=marker, tag=bk_about] bk.hp = @s health
scoreboard players operation @e[type=marker, tag=bk_about] bk.wpn = #wpn bots
scoreboard players operation @e[type=marker, tag=bk_about] bk.by = #me bots
