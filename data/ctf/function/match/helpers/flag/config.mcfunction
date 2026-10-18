# THE FLAG LOOK: the only place where the banner patterns are defined.
# Used by the flag item (freeze), the placed flag block and the dropped flag (ctf:match/helpers/*_flag).
# The flag item itself is a magenta banner: the flag logic checks the id "magenta_banner"
# (breaking, pickup, delivery, the stats in ctf:set_parameters).
data modify storage ctf:flag patterns set value [\
    {pattern: "minecraft:gradient_up", color: "light_blue"},\
    {pattern: "minecraft:cross", color: "black"},\
    {pattern: "minecraft:cross", color: "black"},\
    {pattern: "minecraft:circle", color: "lime"},\
    {pattern: "minecraft:flower", color: "black"},\
    {pattern: "minecraft:curly_border", color: "black"},\
    {pattern: "minecraft:curly_border", color: "black"}\
]
