; Dual Orb - Seirei Tama Densetsu (SNES, LoROM, 2 MB, Headerless)
; Patch: Double Repel Duration (16 Steps) for Demete Spell & Sun Shard Item
; Leaves Moon Shard (enemy attract at $21:BE61) untouched at vanilla 8 steps.

lorom

org $21AFFB
    db $10                  ; Demete Spell duration = 16 ticks (vanilla: $08)

org $21BE47
    db $10                  ; Sun Shard Item duration = 16 ticks (vanilla: $08)
