# A task completed by the executing player. Only attackers, only round / end_round. id
execute unless entity @s[tag=attack, tag=player] run return 0
execute unless score game state = round state unless score game state = end_round state run return 0
$function ctf_loot:task_force {id: "$(id)"}
