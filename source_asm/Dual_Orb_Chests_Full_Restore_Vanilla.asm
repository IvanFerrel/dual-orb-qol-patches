; Dual Orb - Seirei Tama Densetsu (SNES, LoROM, 2 MB, Headerless)
; Restore: Reverts treasure chest overflow check back to vanilla 1993.

lorom

org $10A4A3
    db $B0,$02              ; BCS $A4A7
