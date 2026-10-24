# #ctf:on/freeze_start
execute as @a[tag=player] run function ctf_maps:api/call_current {function: "freeze"}
