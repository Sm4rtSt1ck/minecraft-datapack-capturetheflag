# The link $(a) -> $(b) observed once more (n); a special kind (2+) replaces a walk (t). New: added unless
# the map has 800 links already
$execute unless data storage ctf_bots:learn cur.links[{a: $(a), b: $(b)}] store result score #nl lrn run data get storage ctf_bots:learn cur.links
$execute unless data storage ctf_bots:learn cur.links[{a: $(a), b: $(b)}] if score #nl lrn matches ..799 run data modify storage ctf_bots:learn cur.links append value {a: $(a), b: $(b), t: $(t), n: 0, f: 0, s: 0}
$execute store result score #n lrn run data get storage ctf_bots:learn cur.links[{a: $(a), b: $(b)}].n
scoreboard players add #n lrn 1
$execute store result storage ctf_bots:learn cur.links[{a: $(a), b: $(b)}].n int 1 run scoreboard players get #n lrn
$execute if score #t lrn matches 2.. run data modify storage ctf_bots:learn cur.links[{a: $(a), b: $(b)}].t set value $(t)
