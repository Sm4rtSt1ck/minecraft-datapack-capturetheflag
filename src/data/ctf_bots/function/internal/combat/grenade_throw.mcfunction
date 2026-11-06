# As a bot throwing a grenade (ctf_bots:internal/combat/grenade): towards its target, pitch degrees up,
# with the speed of its distance; 3 blocks of the throw must be free (else no throw, kept)
$execute anchored eyes facing entity @e[tag=bot_nt, limit=1] feet rotated ~ -$(pitch) positioned ^ ^ ^1 unless block ~ ~ ~ #ctf_bots:gap run return 0
$execute anchored eyes facing entity @e[tag=bot_nt, limit=1] feet rotated ~ -$(pitch) positioned ^ ^ ^2 unless block ~ ~ ~ #ctf_bots:gap run return 0
$execute anchored eyes facing entity @e[tag=bot_nt, limit=1] feet rotated ~ -$(pitch) positioned ^ ^ ^3 unless block ~ ~ ~ #ctf_bots:gap run return 0
scoreboard players remove @s bot.he 1
$execute anchored eyes facing entity @e[tag=bot_nt, limit=1] feet rotated ~ -$(pitch) positioned ^ ^ ^0.6 run function ctf_bots:internal/combat/throw {speed: "$(speed)"}
playsound minecraft:entity.splash_potion.throw player @a[tag=!lobby] ~ ~ ~ 1 1
