# Run every tick (ctf:tick)
execute if entity @a[scores={fx.shake=1..}, limit=1] run function ctf_fx:shake/tick
