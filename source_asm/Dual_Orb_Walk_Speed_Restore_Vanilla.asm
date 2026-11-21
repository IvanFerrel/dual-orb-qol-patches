; Dual Orb - Seirei Tama Densetsu (SNES, LoROM, 2 MB, Headerless)
; Restore: Cleanly reverts BOTH Hold R and Toggle R + D-Pad walk speed patches
; back to vanilla 1993 (1 px/frame) and clears Bank $01 free space ($01:FD00).

lorom

org $10CB46
    db $AF,$C8,$D7,$7F,$F0,$06,$98,$18,$69,$40,$00,$A8

org $10CC14
    db $AF,$C8,$D7,$7F,$F0,$06,$98,$18,$69,$40,$00,$A8

org $01FD00
    rep 77 : db $FF                 ; Restores free space ($FF padding)
