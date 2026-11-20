; Dual Orb - Seirei Tama Densetsu (SNES, LoROM, 2 MB, Headerless)
; Patch: Caps Luck at 99 on level up (matching the 2-digit status screen max).
;
; 20:92A0 adds +2 or +4 to Luck ($0E5B,X) with no upper bound check. Near 99 it
; overflowed and the status screen wrapped to "02", "03", etc.
; Change: Both branches (+2 and +4) add, clamp to 99 if >= 100, and store.
; Works with or without the "+4 Luck" patch. Already-overflowed stats (100+)
; are automatically healed on the next level up.

lorom

org $2092BC
    JSL Luck2
    NOP : NOP           ; original: ADC #$0002 / STA $0E5B,X

org $2092CB
    JSL Luck4
    NOP : NOP           ; original: ADC #$0004 / STA $0E5B,X

org $01FE00
Luck2:
    ADC #$0002          ; (original CLC remains right before the JSL)
    CMP #$0064
    BCC +
    LDA #$0063
+   STA $0E5B,X
    RTL

Luck4:
    ADC #$0004
    CMP #$0064
    BCC +
    LDA #$0063
+   STA $0E5B,X
    RTL
