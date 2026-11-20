; Dual Orb - Seirei Tama Densetsu (SNES, LoROM, 2 MB, Headerless)
; Patch: 30-Step Grace Period (Modern)
; 0% encounter chance for the first 30 steps after battle; smooth progressive scaling thereafter.

lorom

org $2182EA
    db $C9,$50,$00,$B0,$37  ; CMP #$0050 (80 steps) : BCS +$37
    db $C9,$46,$00,$B0,$2D  ; CMP #$0046 (70 steps) : BCS +$2D
    db $C9,$3C,$00,$B0,$23  ; CMP #$003C (60 steps) : BCS +$23
    db $C9,$32,$00,$B0,$19  ; CMP #$0032 (50 steps) : BCS +$19
    db $C9,$28,$00,$B0,$0F  ; CMP #$0028 (40 steps) : BCS +$0F
    db $C9,$1E,$00,$B0,$05  ; CMP #$001E (30 steps) : BCS +$05
    db $18,$60,$EA,$EA,$EA  ; CLC : RTS : NOP : NOP : NOP (0% chance under 30 steps)
