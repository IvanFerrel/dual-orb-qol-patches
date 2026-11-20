; Dual Orb - Seirei Tama Densetsu (SNES, LoROM, 2 MB, Headerless)
; Restore: Reverts walking speed back to vanilla 1993 (1 px/frame).

lorom

org $10CB46
    db $AF,$C8,$D7,$7F,$F0,$06,$98,$18,$69,$40,$00,$A8

org $10CC14
    db $AF,$C8,$D7,$7F,$F0,$06,$98,$18,$69,$40,$00,$A8
