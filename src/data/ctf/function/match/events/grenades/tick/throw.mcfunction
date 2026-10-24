# #ctf:tick/freeze, #ctf:tick/combat
execute as @a[scores={just_threw_grenade=1..}] run function ctf:match/events/grenades/throw
execute as @a[scores={just_threw_smoke=1..}] run function ctf:match/events/grenades/smoke/throw
function ctf:match/events/grenades/smoke/tick
