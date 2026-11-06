# A product without arguments $(fn) bought by its click: its result, announced (ctf_shop:internal/announce)
$execute store result score #ok shop.tmp run function $(fn)
$return run function ctf_shop:internal/announce {ok: "#ok", id: "$(id)"}
