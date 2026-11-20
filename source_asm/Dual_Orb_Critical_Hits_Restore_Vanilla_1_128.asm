; Dual Orb - Seirei Tama Densetsu (SNES, LoROM, 2 MB, Headerless)
; Restore: Reverts physical critical hit rate back to vanilla 1/128 (~0.78%).

lorom

org $20C0C0
    db $7F,$00              ; AND #$007F (mask)
    db $D0,$0D              ; BNE +$0D (skip crit)
