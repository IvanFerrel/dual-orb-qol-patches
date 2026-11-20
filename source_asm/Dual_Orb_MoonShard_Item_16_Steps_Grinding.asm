; Dual Orb - Seirei Tama Densetsu (SNES, LoROM, 2 MB, Headerless)
; Patch: Double Moon Shard Duration (16 Steps) for EXP Grinding

lorom

org $21BE61
    db $10                  ; Moon Shard Item duration = 16 ticks (vanilla: $08)
