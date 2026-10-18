# The nearest player that may take this item becomes its owner (only he can pick it up).
# Every player gets at most one item of a kind per tick.
tag @p[tag=player, gamemode=!spectator, tag=ctf.can.trap_def, tag=!ctf.res.trap_def] add ctf.res.new
execute unless entity @a[tag=ctf.res.new, limit=1] run return run data modify entity @s Owner set value [I;0,0,0,1]
data modify entity @s Owner set from entity @a[tag=ctf.res.new, limit=1] UUID
tag @a[tag=ctf.res.new] add ctf.res.trap_def
tag @a[tag=ctf.res.new] remove ctf.res.new
