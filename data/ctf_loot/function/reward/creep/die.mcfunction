# The player dies where the creeper was; the kill goes to #owner kc.tmp (ctf:match/events/credit). src
function ctf_loot:reward/creep/end
gamemode adventure @s
$function ctf:match/events/credit/mark {time: 10, src: $(src)}
kill @s
