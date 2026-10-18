# Carry limits (purchase limits: ctf_shop:limits/reset)
function ctf_inv:limits/one {pred: '*[custom_data~{tags:["he_grenade"]}]', max: 1}
function ctf_inv:limits/one {pred: 'totem_of_undying', max: 1}
function ctf_inv:limits/one {pred: 'shield', max: 1}
function ctf_inv:limits/one {pred: 'potion[custom_data~{lim:"regen"}]', max: 1}
function ctf_inv:limits/one {pred: 'potion[custom_data~{lim:"speed"}]', max: 1}
function ctf_inv:limits/one {pred: 'chorus_fruit', max: 3}
function ctf_inv:limits/one {pred: 'wind_charge', max: 10}
