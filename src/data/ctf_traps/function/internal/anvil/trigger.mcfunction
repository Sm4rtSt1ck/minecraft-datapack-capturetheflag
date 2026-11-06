# The trap goes off: announced (#ctf:on/trap_fired, as its marker: the bots learn which of their traps work)
function #ctf:on/trap_fired
# Kill credit: everyone in the column under the anvil
function ctf_fight:api/credit/owner
execute positioned as @s positioned ~-1 ~-40 ~-1 as @e[type=#ctf:fighter, tag=player, dx=1, dy=40, dz=1] run function ctf_fight:api/credit/mark {time: 60, src: 2}

# The anvil falls (ctf_traps:internal/anvil/fall): a block display moved every tick, not a falling
# block (a falling block lands on the top of a ladder and is gone). Its first speed: 1.5 blocks a tick
execute positioned as @s align xyz run summon block_display ~ ~ ~ {block_state: {Name: "minecraft:anvil"}, teleport_duration: 1, Tags: ["trap", "trap_anvil_fall", "trap_new"]}
scoreboard players set @e[type=block_display, tag=trap_new] trap.d 0
scoreboard players set @e[type=block_display, tag=trap_new] trap.v 1500
tag @e[type=block_display, tag=trap_new] remove trap_new

execute positioned as @s run playsound minecraft:block.anvil.land block @a[tag=!lobby] ~ ~ ~ 1 1

execute positioned as @s run kill @n[tag=trap_display, tag=trap.anvil, distance=1.2..1.5]
kill @s
