; Dual Orb - Seirei Tama Densetsu (SNES, LoROM, 2 MB, Headerless)
; Restore: Reverts Inn pricing back to vanilla 1993 (multiplies by living party count).

lorom

org $108EC4
    db $AD,$00,$00          ; LDA $0000 (vanilla living party count)
