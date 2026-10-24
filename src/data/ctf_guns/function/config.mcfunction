# GUN SETTINGS (run at match start). Damage is reduced by vanilla armor.
#   sniper_damage - 21.19: exactly 20 in leather (7 armor points), ~19.3 in gold, ~17.5 in iron
#   rifle_damage  - 2.35:  ~1.05 in iron (15 armor points), ~1.45 in gold, ~1.8 in leather, 2.35 without armor
#   rifle_knockback_resistance - the rifle knockback is reduced by this (0..1) for the target
#   range - max distance of both guns, blocks (the sniper checks every 0.25 blocks, the rifle every 0.5)
data modify storage ctf_guns:config sniper_damage set value 21.19
data modify storage ctf_guns:config rifle_damage set value 2.35
data modify storage ctf_guns:config rifle_knockback_resistance set value 0.75
data modify storage ctf_guns:config range set value 181

# Assault rifle
#   rifle_rate     - shots per second (any number: the pause alternates, e.g. 6 -> 3-3-4 ticks)
#   rifle_mag      - magazine size
#   rifle_reload   - reload time, ticks
#   rifle_spread_* - spread in tenths of a degree: base + step for every shot of the burst, up to max;
#                    halved while sneaking
data modify storage ctf_guns:config rifle_rate set value 6
data modify storage ctf_guns:config rifle_mag set value 30
data modify storage ctf_guns:config rifle_reload set value 50
data modify storage ctf_guns:config rifle_spread_base set value 10
data modify storage ctf_guns:config rifle_spread_step set value 6
data modify storage ctf_guns:config rifle_spread_max set value 60
