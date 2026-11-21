; ==============================================================================
; Dual Orb - Seirei Tama Densetsu (SNES, LoROM, 2 MB, Headerless)
; Patch: Hold R Button to Run (2x) - Leaves native movement logic untouched
;
; The original code at 10:CB46 (leader) and 10:CC14 (followers) starts with:
;     LDA.l $7FD7C8 : BEQ +6 : TYA : CLC : ADC.w #$0040 : TAY
; This patch replaces ONLY the first instruction (4 bytes) with a JSL to a
; helper that returns the original flag in A (16-bit), or if zero, the R button
; state from Joypad 1. Simply release R during Teresa's Underground escape
; cutscene so the party walks at 1x speed (holding R still dashes at 2x).
; ==============================================================================

lorom

org $10CB46
    JSL RunHelper

org $10CC14
    JSL RunHelper

org $01FD00
RunHelper:
    LDA.l $7FD7C8       ; Original game speed flag (16-bit)
    BNE .ret            ; If non-zero, use 2x table as usual
    LDA.w $4218         ; Joypad 1 (B=$8000, Y=$4000, R=$0010, L=$0020)
    AND.w #$0010        ; R Button mask
.ret:
    RTL
