execute as @a[tag=player, gamemode=!spectator] at @s run function ctf_shop:internal/player_tick

# Actionbar once per second (it stays visible ~3 sec), and right after a purchase
scoreboard players add #clock shop.tmp 1
execute if score #clock shop.tmp matches 20.. run function ctf_shop:internal/actionbar_all
