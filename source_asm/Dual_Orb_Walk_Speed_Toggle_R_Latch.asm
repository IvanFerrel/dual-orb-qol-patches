; ==============================================================================
; Dual Orb - Seirei Tama Densetsu (SNES, LoROM, 2 MB, Headerless)
; Patch: Toggle Run (2x / 1x) via R + any D-Pad direction (with Latch guard)
;
; CONTROLS: Press R + any D-Pad direction to toggle ON (2x),
;           Press R + any D-Pad direction to toggle OFF (1x).
;
; WARNING: Turn off 2x walk before entering the Sealed Shrine before enter the
; undergroud world or else the game Will hang in the Resisty Home escape
; (at 2x speed, Ralph overtakes Teresa and her escort trigger never processes).
; ==============================================================================

lorom

!run   = $7E1FD4        ; 1 = Run mode active (any other value = normal walk)
!latch = $7E1FD6        ; 1 = R button press already latched

org $10CB46
    JSL RunHelper

org $10CC14
    JSL RunHelper

org $01FD00
RunHelper:
    LDA.w $4218             ; Joypad 1
    AND.w #$0010            ; Is R pressed?
    BEQ .released
    LDA.l !latch
    CMP.w #$0001
    BEQ .decide             ; Already latched: do not toggle again
    LDA.w #$0001
    STA.l !latch
    LDA.l !run
    CMP.w #$0001
    BEQ .turnoff
    LDA.w #$0001
    BRA .storerun
.turnoff:
    LDA.w #$0000
.storerun:
    STA.l !run
    BRA .decide
.released:
    LDA.w #$0000
    STA.l !latch            ; R released: re-arm latch
.decide:
    LDA.l $7FD7C8           ; Original speed flag
    BNE .ret                ; If non-zero, use 2x as usual
    LDA.l !run
    CMP.w #$0001
    BNE .zero
    LDA.w #$0001            ; Z=0 -> use 2x velocity table
.ret:
    RTL
.zero:
    LDA.w #$0000            ; Z=1 -> normal 1x speed
    RTL
