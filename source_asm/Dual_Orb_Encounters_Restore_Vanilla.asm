; Dual Orb - Seirei Tama Densetsu (SNES, LoROM, 2 MB, Headerless)
; Restore: Reverts random encounter step thresholds back to vanilla 1993.

lorom

org $2182EA
    db $C9,$12,$00,$B0,$37  ; CMP #$0012 (18 steps) : BCS +$37
    db $C9,$10,$00,$B0,$2D  ; CMP #$0010 (16 steps) : BCS +$2D
    db $C9,$0D,$00,$B0,$23  ; CMP #$000D (13 steps) : BCS +$23
    db $C9,$0A,$00,$B0,$19  ; CMP #$000A (10 steps) : BCS +$19
    db $C9,$07,$00,$B0,$0F  ; CMP #$0007 (7 steps)  : BCS +$0F
    db $C9,$04,$00,$B0,$05  ; CMP #$0004 (4 steps)  : BCS +$05
    db $A9,$7F,$00,$80,$1C  ; LDA #$007F : BRA +$1C (vanilla step 1 check)
