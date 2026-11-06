# A walk test over a gap: a block at the feet: the far edge 1 higher (room for the bot above it)
execute if block ~ ~ ~ #ctf_bots:wall run return 0
execute if block ~ ~1 ~ #ctf_bots:gap if block ~ ~2 ~ #ctf_bots:gap positioned ~ ~1 ~ run function ctf_bots:internal/nav/gap_end
