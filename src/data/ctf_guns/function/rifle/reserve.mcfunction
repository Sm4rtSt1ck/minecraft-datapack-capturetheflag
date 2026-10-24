# #n inv.tmp = rifle rounds in the inventory (the reserve)
from ctf_inv:lib import count
count('*[custom_data~{ammo:"rifle"}]')
