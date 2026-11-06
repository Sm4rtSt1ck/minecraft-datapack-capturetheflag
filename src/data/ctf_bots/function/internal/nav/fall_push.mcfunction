# As a bot at the edge of a fall link, rotated to its next node: the gap jump (lands within 4 blocks:
# ctf_bots:internal/brain/leap), else a push off the edge; it falls (bot_fall: ctf_bots:internal/nav/fall_tick)
tag @s add bot_fall
execute if function ctf_bots:internal/brain/leap run return 1
tag @s add bot_jumper
summon marker ^ ^ ^1 {Tags: ["bot_vec"]}
function ctf_bots:internal/combat/motion {speed: "0.0003", entity: "zombified_piglin", tag: "bot_jumper"}
data modify entity @s Motion[1] set value 0.25d
tag @s remove bot_jumper
