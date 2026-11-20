; Dual Orb - Seirei Tama Densetsu (SNES, LoROM, 2 MB, Headerless)
; Patch: Inn Fixed 2x Rate (50% discount for full 4-member party)

lorom

org $108EC4
    db $A9,$02,$EA          ; LDA #$02 : NOP
