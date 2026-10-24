execute at @s run tp @s ~ ~ ~
execute positioned as @s run summon frog ~ ~1.4 ~ {Health: 1024f, attributes: [{id: "minecraft:max_health", base: 1024d}, {id: "minecraft:knockback_resistance", base: 1d}], Silent: true, NoAI:true, active_effects:[{id:"minecraft:invisibility", duration:9999999,show_particles:false}], Tags: ["trap", "trap_marker", "trap.levitation"]}
