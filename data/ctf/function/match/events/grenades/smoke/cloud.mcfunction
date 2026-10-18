# Runs every tick as a smoke cloud: ~5 blocks wide, 20 seconds (smoke.t = 400 ticks).
# Opaque "dust_color_transition" particles: unlike the campfire smoke they don't fade out (a fading
# translucent particle hides the particles behind it, so the cloud became see-through), they just
# disappear. Each particle goes from light to dark gray during its life, so particles of different
# age give the cloud depth with one command.
# Scale 4 (the max): ~1 block wide puffs living 1.5-8 s.
# "force": shown even to players with reduced / minimal particles
scoreboard players remove @s smoke.t 1
execute if score @s smoke.t matches ..0 run return run kill @s

# Most of the time: keep the cloud dense (checked first, so a normal tick does one check)
execute if score @s smoke.t matches 40..379 run return run particle minecraft:dust_color_transition{from_color:[0.55,0.55,0.55],to_color:[0.42,0.42,0.42],scale:4.0} ~ ~1 ~ 1.5 1.5 1.5 0 15 force @a[tag=!lobby]

# The first second: fill the cloud quickly
execute if score @s smoke.t matches 380.. run return run particle minecraft:dust_color_transition{from_color:[0.55,0.55,0.55],to_color:[0.42,0.42,0.42],scale:4.0} ~ ~1 ~ 1.5 1.5 1.5 0 50 force @a[tag=!lobby]

# The last 2 seconds: thin out
particle minecraft:dust_color_transition{from_color:[0.5,0.5,0.5],to_color:[0.42,0.42,0.42],scale:4.0} ~ ~1 ~ 1.1 0.7 1.1 0 2 force @a[tag=!lobby]
