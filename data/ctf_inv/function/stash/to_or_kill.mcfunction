# Fixed items (stick, ultimate): an extra copy is removed, not dropped
$execute if items entity @a[tag=ctf.stash_owner, limit=1] $(slot) * run return run kill @s
$item replace entity @a[tag=ctf.stash_owner, limit=1] $(slot) from entity @s contents
kill @s
