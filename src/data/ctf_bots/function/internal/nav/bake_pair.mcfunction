# As a node B, at the node A (tag nav_a): how A reaches B (#ok nav: 0 no way, 1 walk, 2 narrow, 3 jump,
# 4 drop, 5 ladder up, 6 ladder down, 7 fall, 8 wind charge up): a walk along the straight line with
# holes as gaps (#mode 0), else with drops / falls (#mode 1), else jumping down over a gap (#mode 2),
# else a ladder near A or a wind charge jump (ctf_bots:internal/nav/ladder_try); a way: the link (ctf_bots:internal/nav/link_add)
tag @s add nav_b
scoreboard players operation #b nav = @s nav.id
function ctf_bots:internal/nav/walk_reset
scoreboard players set #mode nav 0
execute facing entity @s feet rotated ~ 0 run function ctf_bots:internal/nav/walk
execute if score #ok nav matches 0 run function ctf_bots:internal/nav/walk_reset
execute if score #ok nav matches 0 run scoreboard players set #mode nav 1
execute if score #ok nav matches 0 facing entity @s feet rotated ~ 0 run function ctf_bots:internal/nav/walk
execute if score #ok nav matches 0 run function ctf_bots:internal/nav/walk_reset
execute if score #ok nav matches 0 run scoreboard players set #mode nav 2
execute if score #ok nav matches 0 facing entity @s feet rotated ~ 0 run function ctf_bots:internal/nav/walk
execute if score #ok nav matches 0 run function ctf_bots:internal/nav/ladder_try
execute if score #ok nav matches 1.. run function ctf_bots:internal/nav/link_add
tag @s remove nav_b
