<div align="center">

# Dual Orb: Seirei Tama Densetsu (SNES)
### Modular Quality-of-Life (QoL) & Bugfix Patch Suite

[![Platform](https://img.shields.io/badge/Platform-SNES%20%2F%20Super%20Famicom-6366f1?style=for-the-badge)](https://github.com/IvanFerrel/dual-orb-qol-patches)
[![ROM](https://img.shields.io/badge/ROM-LoROM%202MB%20Headerless-10b981?style=for-the-badge)](#target-rom-information)
[![Format](https://img.shields.io/badge/Patches-Modular%20IPS-f59e0b?style=for-the-badge)](#how-to-apply)
[![Source](https://img.shields.io/badge/Source-Asar%2065816%20ASM-8b5cf6?style=for-the-badge)](#repository-structure)

A modular collection of reverse-engineered **IPS patches** and **Asar 65816 assembly source files** for ***Dual Orb: Seirei Tama Densetsu*** (*デュアルオーブ 聖霊玉伝説*, I'MAX, 1993).

**Every patch is 100% independent.** Pick only the improvements you want, stack them in any order, or revert any mechanic back to factory 1993 vanilla at any time.

</div>

---

> [!IMPORTANT]
> **Target ROM & Translation Compatibility:**
> All patches target a clean **2 MB (2,097,152 bytes) Headerless / No-Intro LoROM** image (`.sfc` / `.smc` — do **not** apply to 512-byte headered dumps).
>
> **Tested & Verified On:** [minhnhattonthat's English translation](https://github.com/minhnhattonthat/dual-orb-seirei-tama-densetsu-en) *(there are two English fan translations for Dual Orb — this is the one these patches were built and tested on)*.
>
> **Untested:** The original Japanese ROM *(likely compatible, since these patches modify vanilla engine code and unused `$FF` padding rather than translated text)* and the other English fan translation *(compatibility not guaranteed)*.

---

## Quick Pick: Recommended Setup

Just want to play the game with smooth modern pacing? Apply these **6 independent patches** on top of your ROM:

| Category | Recommended Patch | What It Changes |
| :--- | :--- | :--- |
| **Movement** | [`Dual_Orb_Walk_Speed_Hold_R.ips`](patches/Dual_Orb_Walk_Speed_Hold_R.ips) | Hold **R** to dash at 2x speed (zero cutscene softlock risk) |
| **Encounters** | [`Dual_Orb_Encounters_Toggle_L_Button.ips`](patches/Dual_Orb_Encounters_Toggle_L_Button.ips) | Press **L** anytime to toggle 20-step grace period vs. Vanilla |
| **Item Shops** | [`Dual_Orb_Item_Shops_Topaz_Dust_And_World2_Items.ips`](patches/Dual_Orb_Item_Shops_Topaz_Dust_And_World2_Items.ips) | Adds Topaz Dust (MP) to all shops + Revive & W1 items to World 2 shops |
| **Battle EXP** | [`Dual_Orb_EXP_Divisor_1_Full100.ips`](patches/Dual_Orb_EXP_Divisor_1_Full100.ips) | Every surviving party member receives 100% of battle EXP |
| **Chests** | [`Dual_Orb_Chests_Full_Open_Discard.ips`](patches/Dual_Orb_Chests_Full_Open_Discard.ips) | Opens chests cleanly even when holding 99 of that item |
| **Luck Fix** | [`Dual_Orb_Luck_Cap_99.ips`](patches/Dual_Orb_Luck_Cap_99.ips) | Prevents Luck from overflowing past 99 on the status screen |

> [!TIP]
> Prefer a gentler EXP or Encounter tweak? Every suite below includes multiple presets plus a **Restore Vanilla** patch. Because each module edits a separate ROM routine, you can mix and match freely.

<!--
## Screenshots & Gameplay Previews
Drop your emulator screenshots or short GIFs into an `assets/` folder, then remove these comment tags to display a clean 2-column gallery on GitHub!

| 2x Dash Movement (Hold R / Toggle R) | Expanded Item Shops (Topaz Dust & World 2) |
| :---: | :---: |
| ![2x Dash Movement](assets/dash_preview.gif) | ![Expanded Item Shops](assets/shops_preview.png) |

| L-Button Encounter Toggle | Luck Stat 99 Cap Fix |
| :---: | :---: |
| ![Encounter Toggle](assets/encounters_preview.gif) | ![Luck Cap 99](assets/luck_cap_99.png) |
-->

---

## Table of Contents

1. [Movement Speed & Dash Suite](#1-movement-speed--dash-suite)
2. [Expanded Item Shops Suite](#2-expanded-item-shops-suite)
3. [Random Encounters Suite](#3-random-encounters-suite)
4. [Battle EXP Distribution Suite](#4-battle-exp-distribution-suite)
5. [Level-Up Luck Stat & 99 Cap Suite](#5-level-up-luck-stat--99-cap-suite)
6. [Treasure Chests Overflow Suite](#6-treasure-chests-overflow-suite)
7. [Repel Duration Suite (Demete, Sun Shard & Moon Shard)](#7-repel-duration-suite-demete-sun-shard--moon-shard)
8. [Critical Hits Suite](#8-critical-hits-suite)
9. [Repository Structure & How to Apply](#repository-structure)

---

## 1. Movement Speed & Dash Suite

In the original 1993 release, the party walks at 1 pixel/frame with no run mechanic. The engine actually contains an unused 2x directional velocity table at `$10:CC72` (`+0x40` bytes past the standard 1x table at `$10:CC32`).

| Patch File | Behavior | ROM Offsets | Recommendation |
| :--- | :--- | :--- | :--- |
| [`Dual_Orb_Walk_Speed_Hold_R.ips`](patches/Dual_Orb_Walk_Speed_Hold_R.ips) | **Hold R to Dash (2x).** Release R to walk at normal 1x. | `0x084B46`, `0x084C14`, `0x00FD00` | **Recommended** (Zero cutscene softlock risk) |
| [`Dual_Orb_Walk_Speed_Toggle_R_Latch.ips`](patches/Dual_Orb_Walk_Speed_Toggle_R_Latch.ips) | **Toggle R + D-Pad (2x / 1x).** Press **R + any D-Pad direction** to turn ON or OFF. Includes latch guard. | `0x084B46`, `0x084C14`, `0x00FD00` | See warning below |
| [`Dual_Orb_Walk_Speed_Restore_Vanilla.ips`](patches/Dual_Orb_Walk_Speed_Restore_Vanilla.ips) | **Restore Vanilla.** Reverts to original 1x walking routines. | `0x084B46`, `0x084C14` | Factory 1993 reset |

> [!WARNING]
> **Story Cutscene Warning (Toggle Patch):**
> **Turn off 2x walk before entering the Sealed Shrine before enter the undergroud world or else the game Will hang in the Resisty Home escape.**
>
> *Why this happens:* During the Resisty Home / Sealed Shrine escape sequence leading into the Underground World, **Teresa** leads the party in a single-file caterpillar formation toward the cutscene trigger point. Because she moves on fixed 1x rails, if 2x walk is active, Ralph moves ahead and overtakes Teresa, so the trigger point never fires and the game softlocks. With the Toggle patch, press **R + any D-Pad direction** to switch back to 1x before entering. With **`Dual_Orb_Walk_Speed_Hold_R.ips`**, this never occurs because R is naturally released during cutscenes.

<details>
<summary><strong>View Asar Source Code — Hold R to Run (<code>Dual_Orb_Walk_Speed_Hold_R.asm</code>)</strong></summary>

```assembly
lorom

org $10CB46
    JSL RunHelper

org $10CC14
    JSL RunHelper

org $01FD00
RunHelper:
    LDA.l $7FD7C8       ; Original speed flag
    BNE .ret            ; If active, run as usual
    LDA.w $4218         ; Joypad 1 data
    AND.w #$0010        ; R Button mask
.ret:
    RTL
```

</details>

<details>
<summary><strong>View Asar Source Code — Toggle R + D-Pad with Latch (<code>Dual_Orb_Walk_Speed_Toggle_R_Latch.asm</code>)</strong></summary>

```assembly
; Controls: Press R + any D-Pad direction to toggle ON (2x) / OFF (1x)
lorom

!run   = $7E1FD4        ; 1 = Run mode active, 0 = Walk mode
!latch = $7E1FD6        ; 1 = R button press latched

org $10CB46
    JSL RunHelper

org $10CC14
    JSL RunHelper

org $01FD00
RunHelper:
    LDA.w $4218
    AND.w #$0010
    BEQ .released
    LDA.l !latch
    CMP.w #$0001
    BEQ .decide
    LDA.w #$0001
    STA.l !latch
    LDA.l !run
    CMP.w #$0001
    BEQ .turnoff
    LDA.w #$0001
    BRA .storerun
.turnoff:
    LDA.w #$0000
.storerun:
    STA.l !run
    BRA .decide
.released:
    LDA.w #$0000
    STA.l !latch
.decide:
    LDA.l $7FD7C8
    BNE .ret
    LDA.l !run
    CMP.w #$0001
    BNE .zero
    LDA.w #$0001
.ret:
    RTL
.zero:
    LDA.w #$0000
    RTL
```

</details>

---

## 2. Expanded Item Shops Suite

In *Dual Orb*, attacking with **magic** is essential for controlling enemy mobs, yet **MP recovery items** are extremely scarce throughout the vanilla game. On top of that, once you reach **World 2**, the **Revive** item and three utility items previously sold in World 1 shops disappear from regular stores and are only obtainable as prizes from World 2's **casino chest-shuffle minigame**.

- **All World 1 Item Shops:** Adds **Topaz Dust** (`$001C`, MP recovery).
- **All World 2 Item Shops** (shops `0–6`, `17–24`, `27–29`, identified by their original 8-item list containing Viggor Essence): Adds **Topaz Dust** (`$001C`, MP recovery), **Wind of Life** (`$001B`, revive), plus **Sylph Bracelet** (`$0017`), **Troll Eye** (`$0018`), and **Sun Shard** (`$0019`).
- All new items are appended cleanly to the end of each shop list without changing original item order (longest list is 13 items; the shop buffer supports up to 16).

| Patch File | Behavior | ROM Offsets |
| :--- | :--- | :--- |
| [`Dual_Orb_Item_Shops_Topaz_Dust_And_World2_Items.ips`](patches/Dual_Orb_Item_Shops_Topaz_Dust_And_World2_Items.ips) | Adds Topaz Dust to all 30 item shops (World 1 & World 2) + Wind of Life, Sylph Bracelet, Troll Eye, and Sun Shard to all World 2 item shops. | `0x00A74E`, `0x00F746` |

<details>
<summary><strong>View Asar Source Code — Expanded Item Shops (<code>Dual_Orb_Item_Shops_Topaz_Dust_And_World2_Items.asm</code>)</strong></summary>

```assembly
; Dual Orb - Seirei Tama Densetsu (SNES, LoROM, 2 MB, Headerless)
; Adds Topaz Dust (MP recovery) to ALL item shops (World 1 & World 2),
; plus Wind of Life (revive), Sylph Bracelet, Troll Eye, and Sun Shard to World 2 shops.
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
```

</details>

---

## 3. Random Encounters Suite

The vanilla 1993 engine rolls for random battles starting from step 1 with a harsh `$7F` mask, making back-to-back battles nearly constant past step 18.

| Patch File | Behavior | ROM Offsets |
| :--- | :--- | :--- |
| [`Dual_Orb_Encounters_Toggle_L_Button.ips`](patches/Dual_Orb_Encounters_Toggle_L_Button.ips) | **Real-Time L-Button Toggle.** Press **L** anytime to switch between 20-step grace period and Vanilla rate (with confirmation SFX). | `0x0000E1`, `0x1082EA`, `0x00FB00`, `0x00FC00` |
| [`Dual_Orb_Encounters_20StepGrace_Balanced.ips`](patches/Dual_Orb_Encounters_20StepGrace_Balanced.ips) | **20-Step Grace Period (Balanced).** 0% battle chance for the first 20 steps with halved escalation thresholds. | `0x1082EA` |
| [`Dual_Orb_Encounters_30StepGrace_Modern.ips`](patches/Dual_Orb_Encounters_30StepGrace_Modern.ips) | **30-Step Grace Period (Modern).** 0% battle chance for the first 30 steps; smooth progressive scaling afterward. | `0x1082EA` |
| [`Dual_Orb_Encounters_40StepGrace_Relaxed.ips`](patches/Dual_Orb_Encounters_40StepGrace_Relaxed.ips) | **40-Step Grace Period (Relaxed).** Ideal for dungeon exploration and story pacing. | `0x1082EA` |
| [`Dual_Orb_Encounters_Restore_Vanilla.ips`](patches/Dual_Orb_Encounters_Restore_Vanilla.ips) | **Restore Vanilla 1993.** Reverts to original step encounter thresholds. | `0x1082EA` |

---

## 4. Battle EXP Distribution Suite

In vanilla *Dual Orb*, battle EXP is divided by the number of surviving party members (`JSR $8B89`). With 4 heroes alive, each character receives only 25% of the monster EXP.

| Patch File | Behavior | ROM Offset | Bytes |
| :--- | :--- | :--- | :--- |
| [`Dual_Orb_EXP_Divisor_1_Full100.ips`](patches/Dual_Orb_EXP_Divisor_1_Full100.ips) | **100% EXP (Divisor = 1).** Every surviving hero earns full monster EXP. | `0x100BBB` | `A9 01 00` |
| [`Dual_Orb_EXP_Divisor_2_Half50.ips`](patches/Dual_Orb_EXP_Divisor_2_Half50.ips) | **50% EXP (Divisor = 2).** Fixed 2-way split. | `0x100BBB` | `A9 02 00` |
| [`Dual_Orb_EXP_Divisor_3_Third33.ips`](patches/Dual_Orb_EXP_Divisor_3_Third33.ips) | **33.3% EXP (Divisor = 3).** Fixed 3-way split. | `0x100BBB` | `A9 03 00` |
| [`Dual_Orb_EXP_Divisor_4_Fixed25.ips`](patches/Dual_Orb_EXP_Divisor_4_Fixed25.ips) | **25% EXP (Divisor = 4).** Fixed 4-way split. | `0x100BBB` | `A9 04 00` |
| [`Dual_Orb_EXP_Restore_Vanilla.ips`](patches/Dual_Orb_EXP_Restore_Vanilla.ips) | **Restore Vanilla.** Restores dynamic division by living member count. | `0x100BBB` | `20 89 8B` |

---

## 5. Level-Up Luck Stat & 99 Cap Suite

While HP, TP, Power, and Agility use fixed level-up tables at `$01:8C09`, **Luck** was the only stat governed by RNG (`$6B & 7`: `0–1` = +2, `2–3` = +4, `4–7` = +0 — a 50% chance of gaining nothing). The original engine also had no upper cap, causing Luck above 99 to wrap visually to `"02"`, `"03"`, etc.

All 4 patches are strictly separate so you can apply the **99 Cap Bugfix** on its own or stack it with **Guaranteed +4 Luck**.

| Patch File | Behavior | ROM Offsets |
| :--- | :--- | :--- |
| [`Dual_Orb_Luck_Max_LevelUp_Plus4.ips`](patches/Dual_Orb_Luck_Max_LevelUp_Plus4.ips) | **Guaranteed +4 Luck.** Routes every level-up to the native +4 branch without altering RNG calls. | `0x1012A6` |
| [`Dual_Orb_Luck_Max_LevelUp_Restore_Vanilla.ips`](patches/Dual_Orb_Luck_Max_LevelUp_Restore_Vanilla.ips) | **Restore Vanilla Luck RNG.** Reverts to original +0 / +2 / +4 roll. | `0x1012A6` |
| [`Dual_Orb_Luck_Cap_99.ips`](patches/Dual_Orb_Luck_Cap_99.ips) | **Canonical 99 Cap Bugfix.** Clamps Luck at 99 for all 4 heroes and heals existing 100+ overflows on next level-up. | `0x1012BC`, `0x1012CB`, `0x00FE00` |
| [`Dual_Orb_Luck_Cap_99_Restore_Vanilla.ips`](patches/Dual_Orb_Luck_Cap_99_Restore_Vanilla.ips) | **Restore Vanilla Uncapped Luck.** Restores original branches and clears `$01:FE00`. | `0x1012BC`, `0x1012CB`, `0x00FE00` |

<details>
<summary><strong>View Asar Source Code — All 4 Modular Luck Files</strong></summary>

**`Dual_Orb_Luck_Max_LevelUp_Plus4.asm`**
```assembly
lorom

org $2092A6
    db $A9,$02,$00      ; LDA #$0002 (forces native +4 branch; $00E388 RNG remains intact)
    db $EA,$EA          ; NOP : NOP
```

**`Dual_Orb_Luck_Max_LevelUp_Restore_Vanilla.asm`**
```assembly
lorom

org $2092A6
    db $A5,$6B          ; LDA $6B
    db $29,$07,$00      ; AND #$0007
```

**`Dual_Orb_Luck_Cap_99.asm`**
```assembly
lorom

org $2092BC
    JSL Luck2
    NOP : NOP

org $2092CB
    JSL Luck4
    NOP : NOP

org $01FE00
Luck2:
    ADC #$0002
    CMP #$0064
    BCC +
    LDA #$0063
+   STA $0E5B,X
    RTL

Luck4:
    ADC #$0004
    CMP #$0064
    BCC +
    LDA #$0063
+   STA $0E5B,X
    RTL
```

**`Dual_Orb_Luck_Cap_99_Restore_Vanilla.asm`**
```assembly
lorom

org $2092BC
    db $69,$02,$00,$9D,$5B,$0E      ; ADC #$0002 / STA $0E5B,X

org $2092CB
    db $69,$04,$00,$9D,$5B,$0E      ; ADC #$0004 / STA $0E5B,X

org $01FE00
    rep 30 : db $FF                 ; Restores free space with $FF padding
```

</details>

---

## 6. Treasure Chests Overflow Suite

In vanilla *Dual Orb*, opening a chest when you already hold 99 of that item triggers an overflow branch (`BCS $A4A7`) that re-locks the chest permanently because the game has no discard menu.

| Patch File | Behavior | ROM Offset | Bytes |
| :--- | :--- | :--- | :--- |
| [`Dual_Orb_Chests_Full_Open_Discard.ips`](patches/Dual_Orb_Chests_Full_Open_Discard.ips) | **Open & Discard Overflow.** Chest opens cleanly, item stays capped at 99, excess is discarded. | `0x0824A3` | `EA EA` |
| [`Dual_Orb_Chests_Full_Restore_Vanilla.ips`](patches/Dual_Orb_Chests_Full_Restore_Vanilla.ips) | **Restore Vanilla 1993.** Restores original `BCS $A4A7` check. | `0x0824A3` | `B0 02` |

---

## 7. Repel Duration Suite (Demete, Sun Shard & Moon Shard)

The **Demete** spell and **Sun Shard** item protect the party from random battles, while **Moon Shard** increases random battle encounter chance. In vanilla 1993, all three effects share a short internal duration timer (`$1327 = 8`) set across three independent routines in Bank `$21`. These patches extend how long the effect lasts (**2x** = `16` or **4x** = `32`).

| Patch File | Behavior | ROM Offsets |
| :--- | :--- | :--- |
| [`Dual_Orb_Demete_And_SunShard_32_Steps_MoonShard_Vanilla.ips`](patches/Dual_Orb_Demete_And_SunShard_32_Steps_MoonShard_Vanilla.ips) | **4x Duration (Timer = 32).** Quadruples Demete & Sun Shard battle-protection duration; Moon Shard stays vanilla (`8`). | `0x10AFFB`, `0x10BE47` |
| [`Dual_Orb_Demete_And_SunShard_16_Steps_MoonShard_Vanilla.ips`](patches/Dual_Orb_Demete_And_SunShard_16_Steps_MoonShard_Vanilla.ips) | **2x Duration (Timer = 16).** Doubles Demete & Sun Shard battle-protection duration; Moon Shard stays vanilla (`8`). | `0x10AFFB`, `0x10BE47` |
| [`Dual_Orb_MoonShard_Item_16_Steps_Grinding.ips`](patches/Dual_Orb_MoonShard_Item_16_Steps_Grinding.ips) | **Moon Shard 2x Duration (Timer = 16).** Doubles how long Moon Shard boosts random battle rate for EXP grinding. | `0x10BE61` |
| [`Dual_Orb_Demete_SunShard_MoonShard_Restore_Vanilla_8.ips`](patches/Dual_Orb_Demete_SunShard_MoonShard_Restore_Vanilla_8.ips) | **Restore Vanilla (Timer = 8).** Reverts Demete, Sun Shard, and Moon Shard back to their original duration. | `0x10AFFB`, `0x10BE47`, `0x10BE61` |

---

## 8. Critical Hits Suite

Vanilla physical critical hits trigger at a `1/128` (`~0.78%`) rate (`AND #$007F : BNE +$0D`).

| Patch File | Behavior | ROM Offset | Bytes |
| :--- | :--- | :--- | :--- |
| [`Dual_Orb_Critical_Hits_Always_100Percent.ips`](patches/Dual_Orb_Critical_Hits_Always_100Percent.ips) | **100% Critical Hits.** Every physical attack lands a critical hit. | `0x1040C2` | `EA EA` |
| [`Dual_Orb_Critical_Hits_50Percent.ips`](patches/Dual_Orb_Critical_Hits_50Percent.ips) | **50% Critical Hits.** `1/2` chance per physical attack. | `0x1040C0` | `01` |
| [`Dual_Orb_Critical_Hits_25Percent.ips`](patches/Dual_Orb_Critical_Hits_25Percent.ips) | **25% Critical Hits.** `1/4` chance per physical attack. | `0x1040C0` | `03` |
| [`Dual_Orb_Critical_Hits_Restore_Vanilla_1_128.ips`](patches/Dual_Orb_Critical_Hits_Restore_Vanilla_1_128.ips) | **Restore Vanilla (`1/128`).** Reverts critical hit mask and branch. | `0x1040C0`, `0x1040C2` | `7F 00` / `D0 0D` |

---

## Repository Structure

```text
dual-orb-qol-patches/
├── README.md        # Full English documentation & quick-pick guide
├── patches/         # 28 ready-to-apply modular .ips patches (100% English filenames)
└── source_asm/      # 28 matching Asar 65816 .asm source files (1-to-1 with patches/)
```

---

## Target ROM Information

- **Game:** *Dual Orb: Seirei Tama Densetsu* (Super Famicom / SNES, I'MAX, 1993)
- **Mapping:** LoROM, 2 MB (`2,097,152` bytes)
- **Header:** Headerless / No-Intro (no 512-byte SMC header)
- **Tested On:** [minhnhattonthat / `dual-orb-seirei-tama-densetsu-en`](https://github.com/minhnhattonthat/dual-orb-seirei-tama-densetsu-en)
- **Untested:** Original Japanese ROM (likely compatible) & the other English fan translation (not guaranteed)

---

## How to Apply

1. Start with a clean, headerless `Dual Orb (J)` ROM (`.sfc` / `.smc`).
2. *(Optional)* Apply **[minhnhattonthat's English fan translation](https://github.com/minhnhattonthat/dual-orb-seirei-tama-densetsu-en)** first.
3. Download any `.ips` files you want from the [`patches/`](patches/) folder (or grab the complete `.ZIP` from **Releases**).
4. Apply each `.ips` file using **[Floating IPS (Flips)](https://github.com/Alcaro/Flips)** or **Lunar IPS (LIPS)**.
   - Every patch targets an independent routine, so you can stack multiple `.ips` files in any order.
5. Play on **Mesen**, **Snes9x**, **bsnes**, or real SNES hardware via flashcart.

---

<div align="center">

*Reverse-engineered and assembled for **Dual Orb: Seirei Tama Densetsu** (I'MAX, 1993).*

</div>
