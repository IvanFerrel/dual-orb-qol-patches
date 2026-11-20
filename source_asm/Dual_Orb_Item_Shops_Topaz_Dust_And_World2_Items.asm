; Dual Orb - Seirei Tama Densetsu (SNES, LoROM, 2 MB, Headerless)
; Patch: Adds Topaz Dust (MP recovery) to ALL item shops (World 1 & World 2);
; World 2 shops also gain Wind of Life (revive) plus Sylph Bracelet, Troll Eye,
; and Sun Shard (items previously sold only in World 1 and locked behind World 2's
; casino chest-shuffle minigame).
; World 2 shops are identified by their original 8-item list containing Viggor Essence
; (sold by no World 1 shop): shops 0, 1, 2, 3, 4, 5, 6, 17, 18, 19, 20, 21, 22, 23, 24, 27, 28, 29.
; New items are appended to the end of each list without changing original item order.
; The shop buffer supports up to 16 items (the longest list here is 13 items).

lorom

; Expanded shop lists stored in Bank $01 free space ($FF padding at end of bank)
org $01F746
List_F746:   ; Viggor, Herb, Antidote, MoonShard, CrabShell, BlowHorn, FairyWing, Hourglass, Sylph, TrollEye, SunShard, WindOfLife, TopazDust
    dw $0007,$0015,$0016,$001A,$0023,$0024,$0025,$0026,$0017,$0018,$0019,$001B,$001C,$0000
org $01F762
List_F762:   ; Herb, Antidote, Sylph, SunShard, TopazDust
    dw $0015,$0016,$0017,$0019,$001C,$0000
org $01F76E
List_F76E:   ; Herb, Antidote, Sylph, SunShard, CrabShell, BlowHorn, FairyWing, TopazDust
    dw $0015,$0016,$0017,$0019,$0023,$0024,$0025,$001C,$0000
org $01F780
List_F780:   ; Herb, Antidote, Sylph, TrollEye, SunShard, CrabShell, BlowHorn, FairyWing, TopazDust
    dw $0015,$0016,$0017,$0018,$0019,$0023,$0024,$0025,$001C,$0000
org $01F794
List_F794:   ; Herb, Antidote, Sylph, SunShard, CrabShell, BlowHorn, FairyWing, WindOfLife, TopazDust
    dw $0015,$0016,$0017,$0019,$0023,$0024,$0025,$001B,$001C,$0000

; Pointer table for all 30 item shops (index = shop ID)
org $01A74E
    dw List_F746   ; Shop 0 (World 2)
    dw List_F746   ; Shop 1 (World 2)
    dw List_F746   ; Shop 2 (World 2)
    dw List_F746   ; Shop 3 (World 2)
    dw List_F746   ; Shop 4 (World 2)
    dw List_F746   ; Shop 5 (World 2)
    dw List_F746   ; Shop 6 (World 2)
    dw List_F762   ; Shop 7
    dw List_F762   ; Shop 8
    dw List_F762   ; Shop 9
    dw List_F762   ; Shop 10
    dw List_F76E   ; Shop 11
    dw List_F780   ; Shop 12
    dw List_F780   ; Shop 13
    dw List_F794   ; Shop 14
    dw List_F76E   ; Shop 15
    dw List_F76E   ; Shop 16
    dw List_F746   ; Shop 17 (World 2)
    dw List_F746   ; Shop 18 (World 2)
    dw List_F746   ; Shop 19 (World 2)
    dw List_F746   ; Shop 20 (World 2)
    dw List_F746   ; Shop 21 (World 2)
    dw List_F746   ; Shop 22 (World 2)
    dw List_F746   ; Shop 23 (World 2)
    dw List_F746   ; Shop 24 (World 2)
    dw List_F762   ; Shop 25
    dw List_F76E   ; Shop 26
    dw List_F746   ; Shop 27 (World 2)
    dw List_F746   ; Shop 28 (World 2)
    dw List_F746   ; Shop 29 (World 2)
