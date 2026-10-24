#########################################
# EVENTS HANDLING

execute as @a[tag=lobby, scores={just_died=1..}] run function ctf:lobby/events/die

#########################################
# OTHER

# Kill menu items if player drops them
execute as @e[type=item] if items entity @s contents *[custom_data~{tags:["menu"]}] run kill @s

#########################################
# TICKS

execute if score game state = lobby state run function ctf:lobby/not_vote/tick
execute if score game state = vote state run function ctf:lobby/vote/tick
