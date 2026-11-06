# Advancement reward: the player killed a bot. Counted like a player kill (playerKillCount doesn't
# count mobs): ctf_fight:internal/kill gives the money, the ultimate points, the loot tasks
advancement revoke @s only ctf_bots:killed
scoreboard players add @s kills 1
scoreboard players add @s just_killed 1
# A player's kill: no grenade / trap credit for this death (ctf_bots:internal/credit/watch)
scoreboard players set #vkill bots 2
