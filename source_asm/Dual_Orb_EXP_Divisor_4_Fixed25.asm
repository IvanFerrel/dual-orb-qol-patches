; Dual Orb - Seirei Tama Densetsu (SNES, LoROM, 2 MB, Headerless)
; Patch: Battle EXP Divisor = 4 (25% EXP fixed 4-way split)

lorom

org $208BBB
    db $A9,$04,$00          ; LDA #$0004
