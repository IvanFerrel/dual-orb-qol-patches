; Dual Orb - Seirei Tama Densetsu (SNES, LoROM, 2 MB, Headerless)
; Patch: 100% Physical Critical Hits (Crushing Blow)
; NOPs out the BNE +$0D skip branch at $20:C0C2.

lorom

org $20C0C2
    db $EA,$EA              ; NOP : NOP (vanilla: BNE +$0D)
