# Drops the flag (the broken banner) at the target. target
$execute positioned as $(target) run summon item ~ ~ ~ {Glowing:true, PickupDelay:10, Invulnerable: true, Tags:["flag", "ctf.flag_new"], Item:{id:"minecraft:magenta_banner", count:1, components: {custom_name: '{"text": "FLAG", "color":"red", "italic": false}'}}}
execute as @e[type=item, tag=ctf.flag_new] run function ctf_flag:internal/apply_item
