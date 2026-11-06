# As a defense bot led too far from its post by its target: back to the post (its defend spot, else
# the flag): its lure there is its target
execute if entity @e[type=marker, tag=bot_post] at @n[type=marker, tag=bot_post] run function ctf_bots:internal/brain/lure_here
execute unless entity @e[type=marker, tag=bot_post] at @n[type=armor_stand, tag=flag] run function ctf_bots:internal/brain/lure_here
return 1
