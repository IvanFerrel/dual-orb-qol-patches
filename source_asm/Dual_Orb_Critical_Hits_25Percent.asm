; Dual Orb - Seirei Tama Densetsu (SNES, LoROM, 2 MB, Headerless)
; Patch: 25% Physical Critical Hit Rate (1/4)
; Changes critical RNG bitmask at $20:C0C0 from #$007F (1/128) to #$0003 (1/4).

lorom

org $20C0C0
    db $03                  ; AND #$0003
