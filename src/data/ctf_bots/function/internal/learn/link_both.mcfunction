# Both points of a learned link are nodes (lrn_A, lrn_B): its baked link dearer, else a new one if seen enough
from registry:bots import LEARN
scoreboard players operation #bid lrn = @n[type=marker, tag=lrn_B] nav.id
scoreboard players set #found lrn 0
execute at @n[type=marker, tag=lrn_A] as @e[type=marker, tag=nav_link, distance=..0.1] if score @s nav.to = #bid lrn run function ctf_bots:internal/learn/link_cost
execute if score #found lrn matches 0 if score #ln lrn matches (f"{LEARN['observed']}..") at @n[type=marker, tag=lrn_A] run function ctf_bots:internal/learn/link_new
