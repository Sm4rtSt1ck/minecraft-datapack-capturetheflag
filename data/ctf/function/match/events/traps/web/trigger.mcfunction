execute positioned as @s run fill ~-1 ~-1 ~-1 ~1 ~1 ~1 cobweb replace air

execute positioned as @s run playsound minecraft:entity.spider.ambient block @a ~ ~ ~ 1 1

execute positioned as @s run kill @n[tag=trap_display, tag=trap.web, distance=1.5..1.51]

tag @s add triggered

data merge entity @s {Invulnerable: true}

# kill @n[tag=trap]
schedule function ctf:match/events/traps/web/remove 200t
