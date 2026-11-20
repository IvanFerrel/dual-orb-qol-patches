; Dual Orb - Seirei Tama Densetsu (SNES, LoROM, 2 MB, Headerless)
; Patch: 20-Step Grace Period (Balanced)
; 0% encounter chance for the first 20 steps after battle; halved escalation thresholds.

lorom

org $2182EA
    db $C9,$3C,$00,$B0,$37  ; CMP #$003C (60 steps) : BCS +$37
    db $C9,$34,$00,$B0,$2D  ; CMP #$0034 (52 steps) : BCS +$2D
    db $C9,$2C,$00,$B0,$23  ; CMP #$002C (44 steps) : BCS +$23
    db $C9,$24,$00,$B0,$19  ; CMP #$0024 (36 steps) : BCS +$19
    db $C9,$1C,$00,$B0,$0F  ; CMP #$001C (28 steps) : BCS +$0F
    db $C9,$14,$00,$B0,$05  ; CMP #$0014 (20 steps) : BCS +$05
    db $18,$60,$EA,$EA,$EA  ; CLC : RTS : NOP : NOP : NOP (0% chance under 20 steps)
