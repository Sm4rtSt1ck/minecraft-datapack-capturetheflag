# As a bot, positioned at where it must go: straight there (ctf_bots:internal/brain/lure_direct) when
# it is near and in sight (ctf_bots:internal/nav/direct) or the map has no graph yet; else along the
# navigation graph (ctf_bots:internal/nav/go, BOTS.md stage 8)
scoreboard players set #dir nav 1
execute if score #ready nav matches 1 store result score #dir nav run function ctf_bots:internal/nav/direct
execute if score #dir nav matches 1 run function ctf_bots:internal/nav/off
execute if score #dir nav matches 1 run return run function ctf_bots:internal/brain/lure_direct
function ctf_bots:internal/nav/go
