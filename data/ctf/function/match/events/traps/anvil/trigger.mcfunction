say match/helpers/tnt_explode

execute positioned as @s run summon minecraft:falling_block ~ ~ ~ {BlockState:{ Name: "anvil"},FallHurtAmount:5,FallHurtMax:20,HurtEntities:true, Motion:[0.0d,-0.5d,0.0d], CancelDrop: true, Silent: true}

execute positioned as @s run playsound minecraft:block.anvil.land block @a ~ ~ ~ 1 1

execute positioned as @s run kill @n[tag=trap_display, tag=trap.anvil, distance=1.2..1.5]
kill @s
