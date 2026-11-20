; Dual Orb - Seirei Tama Densetsu (SNES, LoROM, 2 MB, Headerless)
; Patch: Free Inn (0 Gold) - Resting at any inn costs 0 Gold.

lorom

org $108EC4
    db $A9,$00,$EA          ; LDA #$00 : NOP
