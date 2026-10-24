# #ctf:tick/freeze
execute as @a[scores={just_placed_trap=1..}] run function ctf:match/events/traps/place
execute as @a[scores={carrot_on_stick=1..}] if items entity @s weapon.mainhand carrot_on_a_stick[minecraft:custom_data={tags:["trap", "detector"]}] run function ctf:match/events/traps/detector/place
execute as @e[type=armor_stand, tag=trap_display] positioned as @s unless entity @n[type=frog, tag=trap_marker, distance=1.2..1.5] run kill @s
