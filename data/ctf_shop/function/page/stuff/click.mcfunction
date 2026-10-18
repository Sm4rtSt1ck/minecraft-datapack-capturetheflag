# Keep costs in sync with render.mcfunction
# Limited items (per round): see ctf_shop:product/<item>

execute if score #slot shop.tmp matches 18 run return run function ctf_shop:buy/give {item: "wind_charge", name: '{"text": "Wind charge 5x"}', components: 'custom_data={tags:[""]}', count: 5, cost: 120, offhand: 1}
execute if score #slot shop.tmp matches 20 run return run function ctf_shop:product/regen
execute if score #slot shop.tmp matches 22 run return run function ctf_shop:product/feather_falling_boots {cost: 50}
execute if score #slot shop.tmp matches 24 run return run function ctf_shop:product/totem
execute if score #slot shop.tmp matches 26 run return run function ctf_shop:product/speed
execute if score #slot shop.tmp matches 27 run return run function ctf_shop:product/chorus
execute if score #slot shop.tmp matches 29 run return run function ctf_shop:product/he
