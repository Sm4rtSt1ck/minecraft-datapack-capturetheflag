# The name of the player in the creeper, seen only by his team: a tiny invisible bat (no AI) above the
# creeper (moved with it every tick, ctf_loot:reward/creep/player; riding it, a mob would steer the creeper), in his team (nametagVisibility hideForOtherTeams; an armor stand would show its name to
# everyone: the game ignores the team rule for armor stands). The creeper itself stays out of the teams,
# otherwise it would never go for its own team. The name (a text with a selector) is resolved on a
# temporary item ("set_name" with entity "this", like the loot crate sign)
summon bat ~ ~ ~ {NoAI: 1b, Invulnerable: 1b, NoGravity: 1b, Silent: 1b, PersistenceRequired: 1b, DeathLootTable: "minecraft:empty", CustomNameVisible: 1b, Tags: ["loot.creep_tag", "loot.creep_tag_new"], active_effects: [{id: "minecraft:invisibility", duration: -1, show_particles: 0b}], attributes: [{id: "minecraft:scale", base: 0.0625d}]}
summon item_display ~ ~ ~ {Tags: ["loot.creep_name"], item: {id: "minecraft:stone", count: 1}}
tag @s add loot.creep_named
item modify entity @e[type=item_display, tag=loot.creep_name, limit=1] contents {function: "minecraft:set_name", entity: "this", name: {selector: "@a[tag=loot.creep_named]"}}
data modify entity @e[type=bat, tag=loot.creep_tag_new, limit=1] CustomName set from entity @e[type=item_display, tag=loot.creep_name, limit=1] item.components."minecraft:custom_name"
kill @e[type=item_display, tag=loot.creep_name]
tag @s remove loot.creep_named

execute if entity @s[team=team_1] run team join team_1 @e[type=bat, tag=loot.creep_tag_new]
execute if entity @s[team=team_2] run team join team_2 @e[type=bat, tag=loot.creep_tag_new]
scoreboard players operation @e[type=bat, tag=loot.creep_tag_new] loot.cown = @s player_id
tp @e[type=bat, tag=loot.creep_tag_new, limit=1] ~ ~1.75 ~
tag @e[type=bat, tag=loot.creep_tag_new] remove loot.creep_tag_new
