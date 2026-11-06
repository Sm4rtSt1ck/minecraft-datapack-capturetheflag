# As a bot, its arrows at its target (storage ctf_bots:shot: yaw - degrees to a side (a miss), elevation
# - degrees up, fire - burning, three - 1: the crossbow's multishot, 3 arrows)
$execute anchored eyes facing entity @a[tag=bot_tc, limit=1] eyes rotated ~$(yaw) ~-$(elevation) positioned ^ ^ ^0.6 run function ctf_bots:internal/combat/arrow {fire: $(fire)}
$execute if score #one bots matches $(three) anchored eyes facing entity @a[tag=bot_tc, limit=1] eyes rotated ~$(yaw) ~-$(elevation) rotated ~-10 ~ positioned ^ ^ ^0.6 run function ctf_bots:internal/combat/arrow {fire: $(fire)}
$execute if score #one bots matches $(three) anchored eyes facing entity @a[tag=bot_tc, limit=1] eyes rotated ~$(yaw) ~-$(elevation) rotated ~10 ~ positioned ^ ^ ^0.6 run function ctf_bots:internal/combat/arrow {fire: $(fire)}
