# As a bot, rotated to where it jumps: its motion forward (speed, per thousandth) and up
tag @s add bot_jumper
summon marker ^ ^ ^1 {Tags: ["bot_vec"]}
$function ctf_bots:internal/combat/motion {speed: "$(speed)", entity: "zombified_piglin", tag: "bot_jumper"}
$data modify entity @s Motion[1] set value $(up)d
tag @s remove bot_jumper
# Its lure moves a little (back at the next think): the mob plans its path again from where it
# lands (its old path went down into the gap: it would turn back)
scoreboard players operation #jn bots = @s bot.n
execute as @e[type=rabbit, tag=bot_lure] if score @s bot.own = #jn bots at @s run tp @s ~ ~1.5 ~
playsound minecraft:entity.goat.long_jump neutral @a[tag=!lobby] ~ ~ ~ 1 1
