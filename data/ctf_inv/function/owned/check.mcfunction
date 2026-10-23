# Runs in the layout check. Loot crate rewards carry custom_data {ctf_bound:1b, ctf_owner:<player_id>}
execute unless items entity @s container.* *[custom_data~{ctf_bound:1b}] unless items entity @s weapon.offhand *[custom_data~{ctf_bound:1b}] unless items entity @s player.cursor *[custom_data~{ctf_bound:1b}] run return 0
execute store result storage ctf_inv:tmp own.me int 1 run scoreboard players get @s player_id
function ctf_inv:owned/check_me with storage ctf_inv:tmp own

# A reward main weapon next to another main weapon (not the golden sword) goes back
execute if function ctf_inv:layout/has_main_besides_reward run function ctf_inv:owned/take_main

execute if entity @e[type=item, tag=ctf.buf, limit=1] at @s run function ctf_inv:owned/return_all
