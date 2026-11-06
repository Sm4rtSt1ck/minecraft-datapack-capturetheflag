# As an intel marker: its block in bk.x / bk.y / bk.z (for the chat)
execute store result score @s bk.x run data get entity @s Pos[0]
execute store result score @s bk.y run data get entity @s Pos[1]
execute store result score @s bk.z run data get entity @s Pos[2]
