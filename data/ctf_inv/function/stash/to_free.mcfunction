execute unless items entity @a[tag=ctf.stash_owner, limit=1] hotbar.3 * run return run function ctf_inv:stash/to {slot: "hotbar.3"}
execute unless items entity @a[tag=ctf.stash_owner, limit=1] hotbar.4 * run return run function ctf_inv:stash/to {slot: "hotbar.4"}
execute unless items entity @a[tag=ctf.stash_owner, limit=1] hotbar.5 * run return run function ctf_inv:stash/to {slot: "hotbar.5"}
function ctf_inv:stash/drop
