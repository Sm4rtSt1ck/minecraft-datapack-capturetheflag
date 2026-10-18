# The same item as in the shop, so it stacks with the others
execute as @a[tag=chorus] run function ctf_inv:give/chorus {count: 1}
tag @a remove chorus
