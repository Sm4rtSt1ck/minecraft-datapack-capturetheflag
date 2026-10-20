# Camera shake step, every tick for players with fx.shake 1..20 (ctf_fx:shake).
# Damped oscillation: the amplitude goes down and the frequency goes up; the steps sum to zero,
# so the view ends where it started. Each player has his own counter.
execute as @a[scores={fx.shake=1}] at @s run rotate @s ~5.96 ~0.12
execute as @a[scores={fx.shake=2}] at @s run rotate @s ~-2.15 ~-3.16
execute as @a[scores={fx.shake=3}] at @s run rotate @s ~-7.03 ~3.60
execute as @a[scores={fx.shake=4}] at @s run rotate @s ~-1.11 ~1.68
execute as @a[scores={fx.shake=5}] at @s run rotate @s ~6.12 ~-3.95
execute as @a[scores={fx.shake=6}] at @s run rotate @s ~1.81 ~1.25
execute as @a[scores={fx.shake=7}] at @s run rotate @s ~-5.33 ~2.16
execute as @a[scores={fx.shake=8}] at @s run rotate @s ~-0.66 ~-3.07
execute as @a[scores={fx.shake=9}] at @s run rotate @s ~4.56 ~1.75
execute as @a[scores={fx.shake=10}] at @s run rotate @s ~-1.46 ~0.09
execute as @a[scores={fx.shake=11}] at @s run rotate @s ~-2.64 ~-1.29
execute as @a[scores={fx.shake=12}] at @s run rotate @s ~2.84 ~1.65
execute as @a[scores={fx.shake=13}] at @s run rotate @s ~-0.38 ~-1.48
execute as @a[scores={fx.shake=14}] at @s run rotate @s ~-1.51 ~1.12
execute as @a[scores={fx.shake=15}] at @s run rotate @s ~1.62 ~-0.78
execute as @a[scores={fx.shake=16}] at @s run rotate @s ~-0.74 ~0.53
execute as @a[scores={fx.shake=17}] at @s run rotate @s ~-0.05 ~-0.35
execute as @a[scores={fx.shake=18}] at @s run rotate @s ~0.31 ~0.22
execute as @a[scores={fx.shake=19}] at @s run rotate @s ~-0.21 ~-0.11
execute as @a[scores={fx.shake=20}] at @s run rotate @s ~0.06 ~0.03
scoreboard players add @a[scores={fx.shake=1..}] fx.shake 1
scoreboard players reset @a[scores={fx.shake=21..}] fx.shake
