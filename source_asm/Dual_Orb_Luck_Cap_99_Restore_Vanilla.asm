; Dual Orb - Seirei Tama Densetsu (SNES, LoROM, 2 MB, Headerless)
; Restore: Undoes Dual_Orb_Luck_Cap_99 and restores original Luck addition logic.
; (Does not touch the "+4 Luck" patch at 20:92A6; restore that separately.)

lorom

org $2092BC
    db $69,$02,$00,$9D,$5B,$0E      ; ADC #$0002 / STA $0E5B,X

org $2092CB
    db $69,$04,$00,$9D,$5B,$0E      ; ADC #$0004 / STA $0E5B,X

org $01FE00
    rep 30 : db $FF                 ; Restores free space ($FF padding)
