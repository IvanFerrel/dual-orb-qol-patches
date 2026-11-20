; Dual Orb - Seirei Tama Densetsu (SNES, LoROM, 2 MB, Headerless)
; Patch: Battle EXP Divisor = 2 (50% EXP fixed 2-way split)

lorom

org $208BBB
    db $A9,$02,$00          ; LDA #$0002
