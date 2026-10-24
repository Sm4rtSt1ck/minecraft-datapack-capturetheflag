# #ctf:tick/round_win (after the defense win checks of ctf:match/round/tick)
# If flag is stolen -> attack wins
execute positioned as @e[type=armor_stand, tag=win_trigger] as @a[tag=attack, distance=..2.5] if function ctf_flag:internal/has_banner run function ctf_flag:internal/bring
