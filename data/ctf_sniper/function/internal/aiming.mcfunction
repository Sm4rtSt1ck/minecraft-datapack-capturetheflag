# Advancement reward: runs every tick while the player looks through the sniper scope
advancement revoke @s only ctf_sniper:aim
scoreboard players add @s sn.aim 1
scoreboard players set @s sn.seen 1
# Aiming during freeze never fires, even if the button is released after the round started
execute if score game state = freeze state run tag @s add sn.cancel
