# A walk test: a block at the feet: a step up (1 block) with room for the bot above it, else no way
execute if block ~ ~1 ~ #ctf_bots:wall run return 0
execute if block ~ ~1 ~ #ctf_bots:gap if block ~ ~2 ~ #ctf_bots:gap positioned ~ ~1 ~ run function ctf_bots:internal/nav/walk_on
