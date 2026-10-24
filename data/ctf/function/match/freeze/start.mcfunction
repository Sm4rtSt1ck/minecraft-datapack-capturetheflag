function admin:log/function {name: "match/freeze/start"}

scoreboard players operation game state = freeze state

# A death camera of the last round ends right away
function ctf:match/events/fight/deathcam/stop_all
function ctf_loot:reward/creep/stop_all

# 60 secs freeze before round start (1200 ticks)
scoreboard players set freeze timer 1200
bossbar set ctf:match max 1200

gamerule fallDamage false

spawnpoint @a[tag=player] -150 0 -150

gamemode adventure @a[tag=attack]
gamemode survival @a[tag=defense]

# kill @e[type=item, nbt={Item:{id:"minecraft:magenta_banner"}}]
# kill @e[type=item, nbt={Item:{id:"minecraft:stick"}}]
kill @e[type=item]
kill @e[type=arrow]
kill @e[type=trident]
kill @e[tag=lastDeathMarker]
# Remove the placed flag if it hadn't been broken
execute positioned as @e[type=armor_stand, tag=flag] run fill ~-10 ~-10 ~-10 ~10 ~10 ~10 air replace magenta_banner
kill @e[tag=flag]

scoreboard players reset * just_used_chorus
scoreboard players reset * bow_used
scoreboard players reset * xbow_used
scoreboard players reset * just_threw_grenade
scoreboard players reset * just_threw_smoke
# Smoke clouds of the last round
kill @e[type=marker, tag=ctf.smoke]
kill @e[type=marker, tag=ctf.smoke_fly]

execute as @a[tag=player] run function ctf_econ:cap

# Flag breaker: given to attackers in slot 8 by ctf_inv (ctf_inv:layout/ensure)
scoreboard players set broken flag_state 0


# Body armor: the team leather set for players without a set (ctf_inv:armor)
execute as @a[tag=player] at @s run function ctf_inv:armor/freeze_default

execute as @a[tag=player] unless items entity @s container.* *[custom_data~{tags:["main weapon"]}] unless items entity @s weapon.offhand *[custom_data~{tags:["main weapon"]}] run \
    give @s golden_sword[enchantments={knockback:2b, sweeping_edge:3b}, custom_data={tags:["main weapon"], bind:1b, wpn:"golden_sword"}]


effect clear @a[tag=player]
effect give @a[tag=player] minecraft:saturation infinite 127 true
effect give @a[tag=player] minecraft:regeneration 1 127 true
effect give @a[tag=player] minecraft:resistance infinite 127 true
effect give @a[tag=defense] minecraft:mining_fatigue infinite 4 true

execute unless entity @a[tag=defense, nbt={Inventory:[{id:"minecraft:frog_spawn_egg", components:{"minecraft:entity_data":{Tags:["trap", "trap_display", "trap.tnt"]}}}]}] run scoreboard players set tnt_trap bought.item 0
execute unless entity @a[tag=defense, nbt={Inventory:[{id:"minecraft:frog_spawn_egg", components:{"minecraft:entity_data":{Tags:["trap", "trap_display", "trap.anvil"]}}}]}] run scoreboard players set anvil_trap bought.item 0
execute unless entity @a[tag=defense, nbt={Inventory:[{id:"minecraft:frog_spawn_egg", components:{"minecraft:entity_data":{Tags:["trap", "trap_display", "trap.web"]}}}]}] run scoreboard players set web_trap bought.item 0
execute unless entity @a[tag=defense, nbt={Inventory:[{id:"minecraft:frog_spawn_egg", components:{"minecraft:entity_data":{Tags:["trap", "trap_display", "trap.levitation"]}}}]}] run scoreboard players set levitation_trap bought.item 0
execute unless entity @a[tag=defense, nbt={Inventory:[{id:"minecraft:frog_spawn_egg", components:{"minecraft:entity_data":{Tags:["trap", "trap_display", "trap.wither"]}}}]}] run scoreboard players set wither_trap bought.item 0
execute unless entity @a[tag=defense, nbt={Inventory:[{id:"minecraft:frog_spawn_egg", components:{"minecraft:entity_data":{Tags:["trap", "trap_display", "trap.detector"]}}}]}] run scoreboard players set detector_trap bought.item 0

execute as @a[tag=player] run function ctf:match/maps/call_current {function: "freeze"}
execute as @a[tag=player] run function ctf_shop:open
# Round purchase limits (grenade, totem, shield, potions, chorus)
execute as @a[tag=player] at @s run function ctf_shop:limits/reset
# Loot crates for the attackers (landing points: ctf:match/maps/<map>/loot)
function ctf_loot:freeze_start
# Chorus fruits can't be eaten during freeze
execute as @a[tag=player] at @s run function ctf_inv:limits/normalize_chorus
# Ammo of every weapon and the mace wind charges are restored to max
execute as @a[tag=player] at @s run function ctf_inv:ammo/fill_all
# Ultimate bar (XP is lost on death)
execute as @a[tag=player] run function ctf:match/events/ultimate/render
# Hotbar layout: gives the stick and the ultimate, ...
execute as @a[tag=player] run function ctf_inv:api/refresh

# Give flag
clear @a[tag=player] minecraft:magenta_banner
clear @a[tag=player] minecraft:armor_stand[item_model="minecraft:magenta_banner"]

# give @r[tag=defense] minecraft:magenta_banner ONLY AFTER CALL MAP FREEZE FUNCTION
# execute positioned as @r[tag=defense] run summon item ~ ~ ~ {Glowing:true, PickupDelay:30, Tags:["flag"],Item:{id:"minecraft:magenta_banner",count:1}}
# give @p minecraft:armor_stand[item_model=magenta_banner, entity_data={id:"minecraft:armor_stand", Tags: ["flag"], Marker: true}]
# summon item ~ ~ ~ {Item: {components:{item_model:"minecraft:magenta_banner", entity_data: {id: "minecraft:armor_stand", Marker: true}}}}
execute positioned as @r[tag=defense] run summon item ~ ~ ~ {Glowing:true, Invulnerable: true, PickupDelay:20, Tags:["flag", "ctf.flag_new"], Item:{id:"minecraft:armor_stand", count:1, components: {\
  custom_name: '{"text": "FLAG", "color":"red", "italic": false}',\
  entity_data: {id: "minecraft:armor_stand", Marker: true, Invisible: true, Tags: ["flag"]},\
  item_model:"minecraft:magenta_banner"\
}}}
# The banner patterns: ctf:match/helpers/flag/config
execute as @e[type=item, tag=ctf.flag_new] run function ctf:match/helpers/flag/apply_item
