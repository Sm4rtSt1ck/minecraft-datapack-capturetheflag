# Advancement reward: the player was hurt by a player (melee, arrows...). kc.hit = who: the last player
# who hurt him is the one the game credits with his death (used by ctf:match/events/credit/trap_task)
advancement revoke @s only ctf:hurt_by_player
tag @s add kc.hit_me
execute on attacker if entity @s[type=player] run scoreboard players operation @a[tag=kc.hit_me, limit=1] kc.hit = @s player_id
tag @s remove kc.hit_me
