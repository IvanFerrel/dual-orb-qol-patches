; Dual Orb - Seirei Tama Densetsu (SNES, LoROM, 2 MB, Headerless)
; Patch: Quadruple Repel Duration (32 Steps) for Demete Spell & Sun Shard Item
; Leaves Moon Shard (enemy attract at $21:BE61) untouched at vanilla 8 steps.

lorom

org $21AFFB
    db $20                  ; Demete Spell duration = 32 ticks (vanilla: $08)

org $21BE47
    db $20                  ; Sun Shard Item duration = 32 ticks (vanilla: $08)
