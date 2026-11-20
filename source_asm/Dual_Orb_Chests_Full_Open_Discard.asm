; Dual Orb - Seirei Tama Densetsu (SNES, LoROM, 2 MB, Headerless)
; Patch: Open & Discard Overflow on Treasure Chests (at 99 items)
; Replaces BCS $A4A7 with NOP : NOP so chests open cleanly and excess is discarded.

lorom

org $10A4A3
    db $EA,$EA              ; NOP : NOP
