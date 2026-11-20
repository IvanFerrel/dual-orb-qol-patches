; Dual Orb - Seirei Tama Densetsu (SNES, LoROM, 2 MB, Headerless)
; Restore: Reverts Demete, Sun Shard, and Moon Shard durations to vanilla 8 steps.

lorom

org $21AFFB
    db $08                  ; Demete Spell = 8 ticks

org $21BE47
    db $08                  ; Sun Shard Item = 8 ticks

org $21BE61
    db $08                  ; Moon Shard Item = 8 ticks
