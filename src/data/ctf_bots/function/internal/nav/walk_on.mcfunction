# A walk test on the floor: a drop of 2+ blocks right or left of the way is a narrow step; then on
execute positioned ^1 ^ ^ if block ~ ~-1 ~ #ctf_bots:gap if block ~ ~-2 ~ #ctf_bots:gap run scoreboard players add #narrow nav 1
execute positioned ^-1 ^ ^ if block ~ ~-1 ~ #ctf_bots:gap if block ~ ~-2 ~ #ctf_bots:gap run scoreboard players add #narrow nav 1
function ctf_bots:internal/nav/walk
