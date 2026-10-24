# #ctf:on/round_win: round rewards (storage ctf:round won {winner, loser, reason})
execute store result score #reason econ.tmp run data get storage ctf:round won.reason
function ctf_econ:round_end with storage ctf:round won
