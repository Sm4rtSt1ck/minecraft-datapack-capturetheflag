# The block of the displays from storage admin:build a {b, s}: state {Name: b, Properties: s}
data modify storage admin:build state set value {}
data modify storage admin:build state.Name set from storage admin:build a.b
data modify storage admin:build state.Properties set from storage admin:build a.s
