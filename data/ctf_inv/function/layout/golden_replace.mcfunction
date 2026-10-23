function ctf_inv:limits/count {pred: '*[custom_data~{tags:["main weapon"]}]'}
execute if score #n inv.tmp matches 2.. run clear @s golden_sword[custom_data~{tags:["main weapon"]}]
