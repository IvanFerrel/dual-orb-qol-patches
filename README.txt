===============================================================================
Dual Orb: Seirei Tama Densetsu (Super Famicom / SNES - 1993)
Modular Quality-of-Life (QoL) Patch Suite v1.0
Developed for Headerless LoROM (2 MB / 2,097,152 bytes)
Tested & Verified On: minhnhattonthat's English Translation
https://github.com/minhnhattonthat/dual-orb-seirei-tama-densetsu-en
(Original Japanese ROM is likely compatible but untested; the other English
fan translation is untested and not guaranteed.)
===============================================================================

[PHILOSOPHY & DESIGN]
Dual Orb is a classic 1993 JRPG with charming art and music, but heavily hampered
by archaic early-90s design friction: punishing random encounter rates with zero
grace period, party EXP dilution, scarce MP items, and slow walking speed.

Every patch in this suite is 100% INDEPENDENT and MODULAR. You can apply only the
features you prefer without being forced into an all-in-one overhaul.
Vanilla / Purist restore patches are included for modified mechanics.

-------------------------------------------------------------------------------
1. ENCOUNTER RATE & GRACE PERIOD SUITE
-------------------------------------------------------------------------------
Rom Offset: 0x1082EA  |  SNES Bank: $21:82EA  |  RAM Step Counter: $7E:1CAD

* Modular Options:
  - Dual_Orb_Encounters_Toggle_L_Button.ips (RECOMMENDED):
    Adds an in-game real-time switch using the L Button!
    Press L anytime to alternate between 20-step balanced grace mode and Vanilla.
    Audible confirmation plays on the next step: Sound $12 = Grace, Sound $17 = Vanilla.
  - Dual_Orb_Encounters_20StepGrace_Balanced.ips:
    20 safe steps with halved escalation thresholds.
  - Dual_Orb_Encounters_30StepGrace_Modern.ips:
    30 safe steps after battle with smooth progressive scaling thereafter.
  - Dual_Orb_Encounters_40StepGrace_Relaxed.ips:
    40 safe steps for relaxed dungeon exploration and story pacing.
  - Dual_Orb_Encounters_Restore_Vanilla.ips:
    Restores the exact original 35 bytes from I'MAX (1993).

-------------------------------------------------------------------------------
2. BATTLE EXPERIENCE (EXP) DISTRIBUTION SUITE
-------------------------------------------------------------------------------
Rom Offset: 0x100BBB  |  SNES Bank: $20:8BBB

* Modular Options:
  - Dual_Orb_EXP_Divisor_1_Full100.ips (RECOMMENDED):
    Every surviving member receives 100% of total battle EXP (Divisor = 1).
  - Dual_Orb_EXP_Divisor_2_Half50.ips: Divides EXP by 2 (50% each).
  - Dual_Orb_EXP_Divisor_3_Third33.ips: Divides EXP by 3 (33% each).
  - Dual_Orb_EXP_Divisor_4_Fixed25.ips: Fixed 4-way division (25% each).
  - Dual_Orb_EXP_Restore_Vanilla.ips: Restores dynamic division by living heroes.

-------------------------------------------------------------------------------
3. DASH & WALK SPEED SUITE (HOLD R / TOGGLE R + D-PAD)
-------------------------------------------------------------------------------
Rom Offsets: 0x84B46 & 0x84C14  |  SNES Bank: $10:CB46 & $10:CC14

* Modular Options:
  - Dual_Orb_Walk_Speed_Hold_R.ips (RECOMMENDED):
    Hold R button on controller 1 to Dash at 2x speed. Release R to return to 1x.
    Zero softlock risk in automatic cutscenes.
  - Dual_Orb_Walk_Speed_Toggle_R_Latch.ips:
    Press R + any D-Pad direction to toggle ON (2x) / OFF (1x). Features latch guard.
    * WARNING:
      Turn off 2x walk before entering the Sealed Shrine before enter the undergroud
      world or else the game Will hang in the Resisty Home escape (at 2x speed,
      Ralph overtakes Teresa and her escort trigger never processes).
  - Dual_Orb_Walk_Speed_Restore_Vanilla.ips:
    Restores the original 1993 1x walking speed routines.

-------------------------------------------------------------------------------
4. LEVEL-UP LUCK STAT GROWTH SUITE (4 SEPARATE PATCHES)
-------------------------------------------------------------------------------
Rom Offsets: 0x1012A6 ($20:92A6), 0x1012BC ($20:92BC), 0x1012CB ($20:92CB), 0x00FE00 ($01:FE00)

* Modular Options (4 Independent Files):
  - Dual_Orb_Luck_Max_LevelUp_Plus4.ips:
    Forces A = 2 at $20:92A6 (LDA #$0002 : NOP NOP) without touching RNG ($00E388 intact).
  - Dual_Orb_Luck_Max_LevelUp_Restore_Vanilla.ips:
    Restores original RNG read at $20:92A6 (LDA $6B : AND #$0007).
  - Dual_Orb_Luck_Cap_99.ips:
    Clamps Luck at 99 on level up and heals existing 100+ overflows automatically.
  - Dual_Orb_Luck_Cap_99_Restore_Vanilla.ips:
    Restores original uncapped code and clears $01:FE00 with 30 bytes of $FF.

-------------------------------------------------------------------------------
5. TREASURE CHEST INVENTORY OVERFLOW SUITE (OPEN & DISCARD AT 99 ITEMS)
-------------------------------------------------------------------------------
Rom Offset: 0x824A3  |  SNES Bank: $10:A4A3

* Modular Options:
  - Dual_Orb_Chests_Full_Open_Discard.ips (RECOMMENDED):
    Replaces BCS $A4A7 with NOP NOP (EA EA). Chest opens cleanly at 99 items.
  - Dual_Orb_Chests_Full_Restore_Vanilla.ips:
    Restores the original 2 bytes (B0 02 / BCS $A4A7).

-------------------------------------------------------------------------------
6. DEMETE SPELL & SUN/MOON SHARD DURATION SUITE
-------------------------------------------------------------------------------
Demete: 0x10AFFB ($21:AFFB) | Sun Shard: 0x10BE47 ($21:BE47) | Moon Shard: 0x10BE61 ($21:BE61)

* Modular Options (Vanilla internal duration timer = 8):
  - Dual_Orb_Demete_And_SunShard_32_Steps_MoonShard_Vanilla.ips (RECOMMENDED):
    Quadruples (4x, timer = 32 / 0x20) Demete & Sun Shard random-battle protection.
    Moon Shard stays at vanilla duration (8).
  - Dual_Orb_Demete_And_SunShard_16_Steps_MoonShard_Vanilla.ips:
    Doubles (2x, timer = 16 / 0x10) Demete & Sun Shard random-battle protection.
    Moon Shard stays at vanilla duration (8).
  - Dual_Orb_MoonShard_Item_16_Steps_Grinding.ips:
    Doubles (2x, timer = 16 / 0x10) Moon Shard encounter-boost duration for grinding.
  - Dual_Orb_Demete_SunShard_MoonShard_Restore_Vanilla_8.ips:
    Restores all three routines to their original vanilla duration (8).

-------------------------------------------------------------------------------
7. EXPANDED ITEM SHOPS SUITE (TOPAZ DUST & WORLD 2 ITEMS)
-------------------------------------------------------------------------------
Pointer Table: 0x00A74E ($01:A74E) | Expanded Lists: 0x00F746 ($01:F746)

* Why This Patch Exists:
  In Dual Orb, attacking with magic is essential for mob control, yet MP recovery
  items are very scarce. In World 2, Wind of Life (revive) and three utility items
  from World 1 shops vanish from stores and are locked behind the casino
  chest-shuffle minigame.

* Modular Option:
  - Dual_Orb_Item_Shops_Topaz_Dust_And_World2_Items.ips:
    Adds Topaz Dust (MP recovery) to ALL item shops in World 1 and World 2.
    Adds Wind of Life (revive), Sylph Bracelet, Troll Eye, and Sun Shard to all
    World 2 item shops without altering original item order.

-------------------------------------------------------------------------------
8. BATTLE CRITICAL HITS SUITE
-------------------------------------------------------------------------------
Rom Offsets: 0x1040C0 ($20:C0C0) & 0x1040C2 ($20:C0C2)

* Modular Options:
  - Dual_Orb_Critical_Hits_Always_100Percent.ips: 100% physical critical hits.
  - Dual_Orb_Critical_Hits_50Percent.ips: 50% physical critical hit rate (1/2).
  - Dual_Orb_Critical_Hits_25Percent.ips: 25% physical critical hit rate (1/4).
  - Dual_Orb_Critical_Hits_Restore_Vanilla_1_128.ips: Restores vanilla 1/128 rate.

-------------------------------------------------------------------------------
9. INN PRICING SUITE (PRICING ONLY — ZERO SIDE EFFECTS)
-------------------------------------------------------------------------------
Rom Offset: 0x080EC4  |  SNES Bank: $10:8EC4 (Original: AD 00 00 / LDA $0000)

* Modular Options (choose only one):
  - Dual_Orb_Inn_FlatRate_1x.ips (RECOMMENDED): Flat 1x base fee regardless of party size.
  - Dual_Orb_Inn_Rate_2x.ips: Fixed 2x rate (50% discount for full 4-hero party).
  - Dual_Orb_Inn_Rate_3x.ips: Fixed 3x rate (25% discount for full party).
  - Dual_Orb_Inn_Free_0G.ips: Free Inn (0 Gold).
  - Dual_Orb_Inn_Original_Vanilla_4x.ips: Restores original 1993 4x per-member multiplier.

-------------------------------------------------------------------------------
[HOW TO APPLY]
1. Obtain a clean headerless ROM of Dual Orb (J) (LoROM, 2 MB).
2. (Optional) Apply minhnhattonthat's English translation patch first:
   https://github.com/minhnhattonthat/dual-orb-seirei-tama-densetsu-en
   (Note: The other English translation patch has NOT been tested with this suite.)
3. Use Lunar IPS (LIPS) or Floating IPS (Flips) to apply any desired .ips file(s).
   Because each patch targets a distinct ROM routine, they can be stacked in any order.
-------------------------------------------------------------------------------
[BONUS: CLASSIC VANILLA 1993 0-MP FIELD MAGIC TRICK (PRESERVED INTACT)]
- Activate: Outside battle, try casting a heal/revive/cure spell on a hero who
  is already at full HP/healthy (error beep plays), then press B to exit.
- Effect: Field spells (Demete, Telepia, Telepiam) consume 0 MP while active.
- Cancels automatically when you cast a spell that legitimately consumes MP.
===============================================================================