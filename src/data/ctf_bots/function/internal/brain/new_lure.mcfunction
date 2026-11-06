# As a bot, positioned: its lure. An invisible, silent, tiny NoAI rabbit, nobody bumps into it (team
# bot_lures). Invulnerable while it must not be the bot's target (ctf_bots:internal/brain/lure_here)
summon rabbit ~ ~ ~ {Tags: ["bot_lure", "bot_mylure", "bot_new"], NoAI: 1b, Silent: 1b, NoGravity: 1b, Invulnerable: 1b, PersistenceRequired: 1b, DeathLootTable: "minecraft:empty", Health: 1024.0f, attributes: [{id: "minecraft:max_health", base: 1024.0}, {id: "minecraft:scale", base: 0.0625}], active_effects: [{id: "minecraft:invisibility", duration: -1, amplifier: 0, show_particles: 0b}, {id: "minecraft:resistance", duration: -1, amplifier: 4, show_particles: 0b}]}
scoreboard players operation @e[type=rabbit, tag=bot_new] bot.own = @s bot.n
team join bot_lures @e[type=rabbit, tag=bot_new]
tag @e[type=rabbit, tag=bot_new] remove bot_new
