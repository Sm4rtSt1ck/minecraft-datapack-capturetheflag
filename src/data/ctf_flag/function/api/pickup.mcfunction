# The flag is picked up: the carrier (a player, ctf_flag:tick/combat, or a bot, ctf_bots) glows
execute if score game state = round state run effect give @s glowing infinite 1 true

scoreboard players set @s flag_pickedup 0