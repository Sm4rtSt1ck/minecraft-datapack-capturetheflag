say match/round/start

scoreboard players set game status 4
# Round timer 120 secs (2400 ticks)
scoreboard players set round timer 2400
bossbar set ctf:match max 2400

gamemode adventure @a[tag=defence]

effect clear @a[tag=player] minecraft:regeneration

# If flag is not set (inventory or dropped) -> attack wins
execute if entity @a[tag=defence, nbt={Inventory:[{id:"minecraft:yellow_banner"}]}] run function ctf:match/round/win_attack
execute if entity @e[type=item, nbt={Item:{id:"minecraft:yellow_banner"}}] run function ctf:match/round/win_attack

function ctf:match/map/map_1/round
