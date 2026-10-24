# #ctf:on/end_round_end
execute as @a[tag=player, tag=ultimate] run function ctf:match/events/ultimate/end
execute as @a[tag=player] run function ctf:match/events/ultimate/add_point {points: 80}
