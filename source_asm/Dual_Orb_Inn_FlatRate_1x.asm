; Dual Orb - Seirei Tama Densetsu (SNES, LoROM, 2 MB, Headerless)
; Patch: Inn Flat Rate (1x) - Charges base room fee for 1 person regardless of party size.
; Replaces LDA $0000 (living party count multiplier) at $10:8EC4 with LDA #$01 : NOP.

lorom

org $108EC4
    db $A9,$01,$EA          ; LDA #$01 : NOP
