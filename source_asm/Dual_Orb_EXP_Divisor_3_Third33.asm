; Dual Orb - Seirei Tama Densetsu (SNES, LoROM, 2 MB, Headerless)
; Patch: Battle EXP Divisor = 3 (33.3% EXP fixed 3-way split)

lorom

org $208BBB
    db $A9,$03,$00          ; LDA #$0003
