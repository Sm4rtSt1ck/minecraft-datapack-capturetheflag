# The player dies where the creeper was; the kill goes to #owner kc.tmp (ctf_fight:internal/credit). src
function ctf_loot:reward/creep/end
gamemode adventure @s
$function ctf_fight:api/credit/mark {time: 10, src: $(src)}
kill @s
