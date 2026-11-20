; Dual Orb - Seirei Tama Densetsu (SNES, LoROM, 2 MB, Headerless)
; Restore: Reverts battle EXP distribution to vanilla dynamic living party count.

lorom

org $208BBB
    db $20,$89,$8B          ; JSR $8B89 (count living party members)
