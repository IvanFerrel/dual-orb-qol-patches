; Dual Orb - Seirei Tama Densetsu (SNES, LoROM, 2 MB, Headerless)
; Patch: Inn Fixed 3x Rate (25% discount for full 4-member party)

lorom

org $108EC4
    db $A9,$03,$EA          ; LDA #$03 : NOP
