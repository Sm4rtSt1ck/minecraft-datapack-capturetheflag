# As a bot losing a duel: it falls back for DUEL "retreat" thinks (ctf_bots:internal/duel/retreat_go,
# from its brain), it says so
from registry:bots import DUEL
scoreboard players set @s bot.ret (DUEL["retreat"])
scoreboard players set @s bot.retcd (DUEL["retreat_again"])
function ctf_bots:internal/talk/retreat
execute if function ctf_bots:internal/duel/retreat_go run return 1
function ctf_bots:internal/brain/target_want
return 1
