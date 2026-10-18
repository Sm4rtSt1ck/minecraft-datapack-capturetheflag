# The damage is dealt by the shooter: the game credits him with the kill (ctf_econ:kill -> wpn "sniper").
# It ignores armor and depends on the armor points of the target (ctf_sniper:config)
# Settings are loaded at match start; load them now if they are missing
execute unless data storage ctf_sniper:config damage_light run function ctf_sniper:config

particle minecraft:damage_indicator ~ ~ ~ 0.1 0.1 0.1 0.1 4 force @a[tag=!lobby]
execute store result score #armor sn.tmp run attribute @a[tag=sn.hit, limit=1] minecraft:armor get
execute if score #armor sn.tmp matches ..7 run data modify storage ctf_sniper:hit damage set from storage ctf_sniper:config damage_light
execute if score #armor sn.tmp matches 8..11 run data modify storage ctf_sniper:hit damage set from storage ctf_sniper:config damage_gold
execute if score #armor sn.tmp matches 12..15 run data modify storage ctf_sniper:hit damage set from storage ctf_sniper:config damage_iron
execute if score #armor sn.tmp matches 16.. run data modify storage ctf_sniper:hit damage set from storage ctf_sniper:config damage_heavy
function ctf_sniper:ray/damage with storage ctf_sniper:hit
playsound minecraft:entity.arrow.hit_player player @a[tag=sn.shooter] ~ ~ ~ 1 0.8
