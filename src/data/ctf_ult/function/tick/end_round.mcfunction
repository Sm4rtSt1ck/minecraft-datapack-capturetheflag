# #ctf:tick/end_round: the ultimates end half a second before the end of end_round
execute if score end_round timer matches 10 as @a[tag=player, tag=ultimate] run function ctf_ult:api/end
