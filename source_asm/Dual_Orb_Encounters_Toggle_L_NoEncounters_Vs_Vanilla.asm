; Dual Orb - Seirei Tama Densetsu (SNES, LoROM, Headerless)
; Patch: Real-Time No-Encounters Toggle via L Button (No Random Battles <-> Vanilla)
; Starts in Vanilla 1993 mode ($7E1FD0 = 0). Press L anytime to toggle:
;   - L ON  ($7E1FD0 = 1): 0% Random Encounters (bosses/scripted battles unaffected) -> SFX $12
;   - L OFF ($7E1FD0 = 0): Vanilla 1993 Encounter Rate                               -> SFX $17
; Confirmation SFX plays on the next step. Uses safe WRAM $7E1FD0 & $7E1FD2.

lorom

; Joypad read hook ($00:80E1 -> JSL $01FC00 : NOP : NOP)
org $0080E1
    db $22,$00,$FC,$01,$EA,$EA

; Step encounter check hook ($21:82EA -> JML $01FB00 + NOP padding; preserves $21:8308 vanilla check)
org $2182EA
    db $5C,$00,$FB,$01
    rep 26 : db $EA
    db $A9,$7F,$00,$80,$1C  ; Vanilla $21:8308 check (LDA #$007F : BRA +$1C)

; Encounter mode evaluator & confirmation SFX routine ($01:FB00, 127 bytes)
; Also resets the step counter ($7E:1CAD = 0) while No Encounters is ON so switching
; back to Vanilla does not trigger an instant ambush battle on the first step.
org $01FB00
    db $C2,$30,$AF,$D2,$1F,$7E,$F0,$24,$A9,$00
    db $00,$8F,$D2,$1F,$7E,$AF,$D0,$1F,$7E,$C9
    db $01,$00,$F0,$05,$A9,$17,$00,$80,$03,$A9
    db $12,$00,$08,$48,$DA,$5A,$22,$69,$88,$00
    db $7A,$FA,$68,$28,$C2,$30,$AF,$D0,$1F,$7E
    db $C9,$01,$00,$D0,$0B,$A9,$00,$00,$8F,$AD
    db $1C,$7E,$5C,$33,$83,$21,$AD,$AD,$1C,$C9
    db $12,$00,$90,$04,$5C,$26,$83,$21,$C9,$10
    db $00,$90,$04,$5C,$21,$83,$21,$C9,$0D,$00
    db $90,$04,$5C,$1C,$83,$21,$C9,$0A,$00,$90
    db $04,$5C,$17,$83,$21,$C9,$07,$00,$90,$04
    db $5C,$12,$83,$21,$C9,$04,$00,$90,$04,$5C
    db $0D,$83,$21,$5C,$08,$83,$21

; Joypad L-Button toggle handler ($01:FC00, 53 bytes)
org $01FC00
    db $08,$E2,$20,$9C,$C7,$0D,$9C,$C3,$0D,$C2
    db $30,$48,$DA,$AD,$CB,$0D,$89,$20,$00,$F0
    db $1C,$AF,$D0,$1F,$7E,$C9,$01,$00,$F0,$05
    db $A9,$01,$00,$80,$03,$A9,$00,$00,$8F,$D0
    db $1F,$7E,$A9,$01,$00,$8F,$D2,$1F,$7E,$FA
    db $68,$28,$6B
