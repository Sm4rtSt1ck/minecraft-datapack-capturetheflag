# The next shot is ready
scoreboard players reset @s sn.reload
execute if items entity @s weapon.mainhand spyglass[custom_data~{wpn:"sniper"}] run playsound minecraft:item.crossbow.loading_end player @s ~ ~ ~ 0.8 1.2
execute if items entity @s weapon.mainhand spyglass[custom_data~{wpn:"sniper"}] run title @s actionbar {"text": "READY", "color": "green", "bold": true}
