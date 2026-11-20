; Dual Orb - Seirei Tama Densetsu (SNES, LoROM, 2 MB, Headerless)
; Patch: Guaranteed +4 Luck on every level up.
; Leaves the native RNG call ($00E388) at 20:92A0 completely intact.
; Replaces the check at 20:92A6 to always route into the native +4 branch.

lorom

org $2092A6
    db $A9,$02,$00      ; LDA #$0002
    db $EA,$EA          ; NOP : NOP
