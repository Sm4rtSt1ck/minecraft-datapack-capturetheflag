# A bot passed (f: "s") / failed (f: "f") the link $(a) -> $(b): counted (a new record if none)
$execute unless data storage ctf_bots:learn cur.links[{a: $(a), b: $(b)}] store result score #nl lrn run data get storage ctf_bots:learn cur.links
$execute unless data storage ctf_bots:learn cur.links[{a: $(a), b: $(b)}] if score #nl lrn matches ..799 run data modify storage ctf_bots:learn cur.links append value {a: $(a), b: $(b), t: 1, n: 0, f: 0, s: 0}
$execute store result score #n lrn run data get storage ctf_bots:learn cur.links[{a: $(a), b: $(b)}].$(f)
scoreboard players add #n lrn 1
$execute store result storage ctf_bots:learn cur.links[{a: $(a), b: $(b)}].$(f) int 1 run scoreboard players get #n lrn
