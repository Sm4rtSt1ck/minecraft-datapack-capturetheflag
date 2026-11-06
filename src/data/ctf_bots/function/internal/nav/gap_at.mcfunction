# A walk test over a gap: up to NAV "gap" blocks; room for the jump; the floor again at the same level
# or 1 higher (a deep hole: also 1-2 lower, after a block and a half): crossed (ctf_bots:internal/nav/gap_end).
# #mode 2: a jump down: any floor below (within NAV "max_fall") after a block and a half
from registry:bots import NAV
scoreboard players add #glen nav 1
execute if score #glen nav matches (f"{NAV['gap'] * 2 + 2}..") run return 0
execute unless block ~ ~ ~ #ctf_bots:gap run return run function ctf_bots:internal/nav/gap_land_up
execute unless block ~ ~1 ~ #ctf_bots:gap run return 0
execute unless block ~ ~-1 ~ #ctf_bots:gap run return run function ctf_bots:internal/nav/gap_end
execute if score #deep nav matches 1 if score #glen nav matches 3.. unless block ~ ~-2 ~ #ctf_bots:gap positioned ~ ~-1 ~ run return run function ctf_bots:internal/nav/gap_end
execute if score #deep nav matches 1 if score #glen nav matches 3.. unless block ~ ~-3 ~ #ctf_bots:gap positioned ~ ~-2 ~ run return run function ctf_bots:internal/nav/gap_end
execute if score #mode nav matches 2 if score #glen nav matches 3.. unless block ~ ~-1 ~ #ctf_bots:gap run return run function ctf_bots:internal/nav/gap_end
execute if score #mode nav matches 2 if score #glen nav matches 3.. run return run function ctf_bots:internal/nav/gap_fall
function ctf_bots:internal/nav/walk
