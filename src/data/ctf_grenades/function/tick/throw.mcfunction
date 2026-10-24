# #ctf:tick/freeze, #ctf:tick/combat
execute as @a[scores={just_threw_grenade=1..}] run function ctf_grenades:internal/throw
execute as @a[scores={just_threw_smoke=1..}] run function ctf_grenades:internal/smoke/throw
function ctf_grenades:internal/smoke/tick
