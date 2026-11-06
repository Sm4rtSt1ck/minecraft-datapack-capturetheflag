# The purchases of the context $(ctx) into storage ctf_bots:learn bc (the players'), bb (what they gave
# the bots)
$data modify storage ctf_bots:learn bc set from storage ctf_bots:learn buy.c$(ctx)
data modify storage ctf_bots:learn bb set value {}
$data modify storage ctf_bots:learn bb set from storage ctf_bots:learn buyb.c$(ctx)
