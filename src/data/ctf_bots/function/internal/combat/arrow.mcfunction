# As a bot, positioned and rotated: an arrow flying this way (speed 3 = a fully drawn bow; its damage
# 2.5 = power 1; piercing 4, like the shop bows), shot by the bot (Owner: the kill is the bot's).
# Its motion: from the arrow to a marker 1 block ahead, times 3. fire: 1 = burning
summon arrow ~ ~ ~ {Tags: ["bot_arrow"], pickup: 0b, damage: 2.5d, PierceLevel: 4b}
summon marker ^ ^ ^1 {Tags: ["bot_vec"]}
function ctf_bots:internal/combat/motion {speed: "0.003", entity: "arrow", tag: "bot_arrow"}
data modify entity @n[type=arrow, tag=bot_arrow] Owner set from entity @s UUID
$execute if score #one bots matches $(fire) run data modify entity @n[type=arrow, tag=bot_arrow] Fire set value 2000s
tag @e[type=arrow, tag=bot_arrow] remove bot_arrow
