; Dual Orb - Seirei Tama Densetsu (SNES, LoROM, 2 MB, Headerless)
; Patch: Battle EXP Divisor = 1 (100% EXP per surviving party member)
; Replaces JSR $8B89 (living party counter) with LDA #$0001.

lorom

org $208BBB
    db $A9,$01,$00          ; LDA #$0001
