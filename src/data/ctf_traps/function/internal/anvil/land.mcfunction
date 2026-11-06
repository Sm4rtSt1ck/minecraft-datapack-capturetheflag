# The falling anvil landed, at its lower corner: the damage of the old falling block (FallHurtAmount 10
# a block, FallHurtMax 20: ceil(fallen - 1) x 10, 20 at most) to everyone in its block, like a vanilla
# falling anvil (falling_anvil: no attacker, the kill credit marks of the trigger give the kill)
scoreboard players operation #i trap.d = @s trap.d
scoreboard players remove #i trap.d 1
scoreboard players set #k trap.d 1000
scoreboard players operation #i trap.d /= #k trap.d
execute if score #i trap.d matches 1 as @e[dx=0, dy=0, dz=0] run damage @s 10 minecraft:falling_anvil
execute if score #i trap.d matches 2.. as @e[dx=0, dy=0, dz=0] run damage @s 20 minecraft:falling_anvil
playsound minecraft:block.anvil.destroy block @a[tag=!lobby] ~0.5 ~ ~0.5 1 1
kill @s
