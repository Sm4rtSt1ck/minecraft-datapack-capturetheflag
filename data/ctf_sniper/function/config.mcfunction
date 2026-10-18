# SNIPER SETTINGS (run at match start)
# Damage ignores armor (damage type ctf_sniper:bullet) and depends on the armor points
# of the target instead, so every armor tier gets exactly the intended damage:
#   damage_light - armor  0..7  (leather, default): one-shot
#   damage_gold  - armor  8..11 (gold): ~75%, doesn't kill a full-health player
#   damage_iron  - armor 12..15 (iron): half of the health
#   damage_heavy - armor 16+    (diamond armor of the ultimate)
# Shields still block the bullet.
data modify storage ctf_sniper:config damage_light set value 20
data modify storage ctf_sniper:config damage_gold set value 15
data modify storage ctf_sniper:config damage_iron set value 10
data modify storage ctf_sniper:config damage_heavy set value 7
#   reload - ticks between shots
#   scope  - ticks of aiming needed for an accurate shot; a quicker shot has a spread
#   spread - max spread of a no-scope shot, tenths of a degree
#   range  - max distance, in steps of 0.25 blocks (400 = 100 blocks)
data modify storage ctf_sniper:config reload set value 60
data modify storage ctf_sniper:config scope set value 10
data modify storage ctf_sniper:config spread set value 80
data modify storage ctf_sniper:config range set value 400
