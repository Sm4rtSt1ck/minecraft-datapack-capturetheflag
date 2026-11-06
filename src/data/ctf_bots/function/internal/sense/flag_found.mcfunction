# An attack bot (bk_me) saw the flag: the team knows where it is (#fknown bots 1), it tells it
scoreboard players set #fknown bots 1
execute as @n[type=armor_stand, tag=flag] run function ctf_bots:internal/talk/pos
execute as @e[type=zombified_piglin, tag=bk_me] run function ctf_bots:internal/talk/flag
function ctf_bots:internal/trick/hide_rec
