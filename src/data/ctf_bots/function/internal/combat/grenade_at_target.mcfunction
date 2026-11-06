# As a bot with its target in sight (bot_tc): a grenade at him (ctf_bots:internal/combat/grenade)
tag @a[tag=bot_tc] add bot_nt
function ctf_bots:internal/combat/grenade
tag @a[tag=bot_tc] remove bot_nt
