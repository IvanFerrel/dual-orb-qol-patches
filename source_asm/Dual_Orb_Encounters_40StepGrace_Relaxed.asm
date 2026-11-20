; Dual Orb - Seirei Tama Densetsu (SNES, LoROM, 2 MB, Headerless)
; Patch: 40-Step Grace Period (Relaxed)
; 0% encounter chance for the first 40 steps after battle; ideal for story & dungeon puzzles.

lorom

org $2182EA
    db $C9,$64,$00,$B0,$37  ; CMP #$0064 (100 steps) : BCS +$37
    db $C9,$5A,$00,$B0,$2D  ; CMP #$005A (90 steps)  : BCS +$2D
    db $C9,$50,$00,$B0,$23  ; CMP #$0050 (80 steps)  : BCS +$23
    db $C9,$46,$00,$B0,$19  ; CMP #$0046 (70 steps)  : BCS +$19
    db $C9,$37,$00,$B0,$0F  ; CMP #$0037 (55 steps)  : BCS +$0F
    db $C9,$28,$00,$B0,$05  ; CMP #$0028 (40 steps)  : BCS +$05
    db $18,$60,$EA,$EA,$EA  ; CLC : RTS : NOP : NOP : NOP (0% chance under 40 steps)
