# SNIPER SETTINGS (run at match start). Damage and range: ctf_guns:config
#   reload - ticks between shots
#   scope  - ticks of aiming needed for an accurate shot; a quicker shot has a spread
#   spread - max spread of a no-scope shot, tenths of a degree
data modify storage ctf_sniper:config reload set value 60
data modify storage ctf_sniper:config scope set value 10
data modify storage ctf_sniper:config spread set value 80
