; Dual Orb - Seirei Tama Densetsu (SNES, LoROM, 2 MB, Headerless)
; Patch: 50% Physical Critical Hit Rate (1/2)
; Changes critical RNG bitmask at $20:C0C0 from #$007F (1/128) to #$0001 (1/2).

lorom

org $20C0C0
    db $01                  ; AND #$0001
