; Dual Orb - Seirei Tama Densetsu (SNES, LoROM, 2 MB, Headerless)
; Restore: Reverts level-up Luck roll back to vanilla (+0, +2, or +4).

lorom

org $2092A6
    db $A5,$6B          ; LDA $6B
    db $29,$07,$00      ; AND #$0007
