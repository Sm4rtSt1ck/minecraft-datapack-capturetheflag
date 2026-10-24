# #ctf:on/end_round_end
execute as @a[tag=player, tag=ultimate] run function ctf_ult:api/end
execute as @a[tag=player] run function ctf_ult:api/add_point {points: 80}
