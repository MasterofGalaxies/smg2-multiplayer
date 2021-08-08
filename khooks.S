#include "multiplayer.h"

.section .kamek


/* Spawn one Mario and one Luigi */

_kHook1:
.long 0x2
.long 0x3
.int initPlacement__15StageDataHolderFv + 0x18
.long spawntwomarios

_kHook2:
.long 0x2
.long 0x3
.int init__10MarioActorFRC12JMapInfoIter + 0x54
.long marioorluigi

_kHook3:
.long 0x2
.long 0x3
.int init__10MarioActorFRC12JMapInfoIter + 0x298
.long setmarioandluigiplayeractor


/* Remap controls */

/* Jump (A) */
_kHook4:
.long 0x3
.long 0x1
.long 0x2
.int getPlayerTriggerA__2MRFv + 0x8
lbz 3, 0x1098 (30)

/* Jump height, Flying Mario/Luigi hover in place (A) */
_kHook5:
.long 0x3
.long 0x1
.long 0x2
.int getPlayerLevelA__2MRFv + 0x8
lbz 3, 0x1098 (30)

/* Yoshi flutter jump (A) */
_kHook6:
.long 0x3
.long 0x1
.long 0x2
.int FUN_803B12B0 + 0x1EC
lbz 3, 0x1098 (31)

/* Unknown (B) */
_kHook7:
.long 0x3
.long 0x1
.long 0x2
.int getPlayerTriggerB__2MRFv + 0x8
lbz 3, 0x1098 (30)

/* Crouch (Z) */
_kHook8:
.long 0x3
.long 0x1
.long 0x2
.int getPlayerLevelZ__2MRFv + 0x8
lbz 3, 0x1098 (30)

/* Ground pound, stop Flying Mario/Luigi flight (Z) */
_kHook9:
.long 0x3
.long 0x1
.long 0x2
.int getPlayerTriggerZ__2MRFv + 0x8
lbz 3, 0x1098 (30)

/* Exit first-person (D-Pad down) */
/*_kHook10:
.long 0x3
.long 0x1
.long 0x2
.int testFpViewOutTrigger__2MRFv + 0x8
lbz 3, 0x1098 (4)*/

/* Unknown (C) */
_kHook11:
.long 0x3
.long 0x1
.long 0x2
.int getPlayerTriggerC__2MRFv + 0x8
lbz 3, 0x1098 (30)

/* Unknown (C) */
_kHook12:
.long 0x3
.long 0x1
.long 0x2
.int FUN_80387C60 + 0x80
lbz 3, 0x1098 (30)

/* Spin (accelerometer) */
_kHook13:
.long 0x3
.long 0x1
.long 0x2
.int updateControllerSwing__10MarioActorFv + 0x78
lbz 3, 0x1098 (30)

/* Spin during Flying Mario/Luigi flight (accelerometer) */
_kHook14:
.long 0x3
.long 0x1
.long 0x2
.int updateControllerSwing__10MarioActorFv + 0x68
lbz 3, 0x1098 (30)

/* Nunchuk spin (nunchuk accelerometer) */
_kHook15:
.long 0x3
.long 0x1
.long 0x2
.int FUN_803CE090 + 0x58
lbz 3, 0x1098 (30)

/* Nunchuk joystick X-axis */

_kHook16:
.long 0x3
.long 0x1
.long 0x2
.int getPlayerStickX__2MRFv + 0x14
nop

_kHook17:
.long 0x2
.long 0x4
.int FUN_803BDC00 + 0x54
.long remapjoystickxplayer

_kHook18:
.long 0x2
.long 0x4
.int FUN_8007D730 + 0x2B4
.long remapjoystickxother

_kHook19:
.long 0x2
.long 0x4
.int FUN_8007D730 + 0x2BC
.long remapjoystickxother

_kHook20:
.long 0x2
.long 0x4
.int FUN_8007D730 + 0x380
.long remapjoystickxother

_kHook21:
.long 0x2
.long 0x4
.int FUN_8007D730 + 0x388
.long remapjoystickxother

_kHook22:
.long 0x2
.long 0x4
.int FUN_804E11D0 + 0xF4
.long remapjoystickxother

_kHook23:
.long 0x2
.long 0x4
.int FUN_804F60F0 + 0x14
.long remapjoystickxother

_kHook24:
.long 0x2
.long 0x4
.int FUN_804F65B0 + 0xE8
.long remapjoystickxother

/* Nunchuk joystick Y-axis */

_kHook25:
.long 0x3
.long 0x1
.long 0x2
.int getPlayerStickY__2MRFv + 0x14
nop

_kHook26:
.long 0x2
.long 0x4
.int FUN_803BDC00 + 0x64
.long remapjoystickyplayer

_kHook27:
.long 0x2
.long 0x4
.int FUN_8007D730 + 0x2C4
.long remapjoystickyother

_kHook28:
.long 0x2
.long 0x4
.int FUN_8007D730 + 0x2CC
.long remapjoystickyother

_kHook29:
.long 0x2
.long 0x4
.int FUN_8007D730 + 0x390
.long remapjoystickyother

_kHook30:
.long 0x2
.long 0x4
.int FUN_8007D730 + 0x398
.long remapjoystickyother

_kHook31:
.long 0x2
.long 0x4
.int FUN_804E11D0 + 0xE8
.long remapjoystickyother

_kHook32:
.long 0x2
.long 0x4
.int FUN_804F60F0 + 0x1C
.long remapjoystickyother

_kHook33:
.long 0x2
.long 0x4
.int FUN_804F65B0 + 0xDC
.long remapjoystickyother


/* New size of the MarioActor class. */
_kHook34:
.long 0x3
.long 0x1
.long 0x2
.int createNameObj10MarioActor__14NameObjFactoryFPCc_P7NameObj + 0x14
li 3, 0x109A

/* New size of the MarioHolder class. */
_kHook35:
.long 0x3
.long 0x1
.long 0x2
.int newEachObj__14SceneObjHolderFi + 0x27C
li 3, 0x2C


/* Teleportation and camera */
_kHook36:
.long 0x3
.long 0x1
.long 0x1
.int __vt__10MarioActor + 0x50
.long handleteleportandcamera


/* Increase functionallity with player 2 */

/* Save pointer to player that triggered collision */
_kHook37:
.long 0x2
.long 0x3
.int FUN_803CBDE0 + 0x284
.long collisionbackupplayerpointer

/* Coins increment correct player's health */
_kHook38:
.long 0x3
.long 0x1
.long 0x2
.int incLife__11MarioAccessFUl + 0x5C
lis 3, 0x8000

_kHook39:
.long 0x3
.long 0x1
.long 0x2
.int incLife__11MarioAccessFUl + 0x60
lwz 3, EMPTYMEM (3)

/* MorphItemNeoHopper */
_kHook40:
.long 0x3
.long 0x1
.long 0x2
.int changeItemStatus__11MarioAccessFl + 0x48
lis 3, 0x8000

_kHook41:
.long 0x3
.long 0x1
.long 0x2
.int changeItemStatus__11MarioAccessFl + 0x4C
lwz 3, EMPTYMEM (3)

/* MorphItemNeoBee */
_kHook42:
.long 0x3
.long 0x1
.long 0x2
.int changeItemStatus__11MarioAccessFl + 0x64
lis 3, 0x8000

_kHook43:
.long 0x3
.long 0x1
.long 0x2
.int changeItemStatus__11MarioAccessFl + 0x68
lwz 3, EMPTYMEM (3)

/* MorphItemNeoTeresa */
_kHook44:
.long 0x3
.long 0x1
.long 0x2
.int changeItemStatus__11MarioAccessFl + 0x80
lis 3, 0x8000

_kHook45:
.long 0x3
.long 0x1
.long 0x2
.int changeItemStatus__11MarioAccessFl + 0x84
lwz 3, EMPTYMEM (3)

/* MorphItemNeoIce */
_kHook46:
.long 0x3
.long 0x1
.long 0x2
.int changeItemStatus__11MarioAccessFl + 0x9C
lis 3, 0x8000

_kHook47:
.long 0x3
.long 0x1
.long 0x2
.int changeItemStatus__11MarioAccessFl + 0xA0
lwz 3, EMPTYMEM (3)

/* MorphItemNeoFire */
_kHook48:
.long 0x3
.long 0x1
.long 0x2
.int changeItemStatus__11MarioAccessFl + 0xB8
lis 3, 0x8000

_kHook49:
.long 0x3
.long 0x1
.long 0x2
.int changeItemStatus__11MarioAccessFl + 0xBC
lwz 3, EMPTYMEM (3)

/* MorphItemNeoFoo */
_kHook50:
.long 0x3
.long 0x1
.long 0x2
.int changeItemStatus__11MarioAccessFl + 0xD4
lis 3, 0x8000

_kHook51:
.long 0x3
.long 0x1
.long 0x2
.int changeItemStatus__11MarioAccessFl + 0xD8
lwz 3, EMPTYMEM (3)

/* BenefitItemInvincible */
_kHook52:
.long 0x3
.long 0x1
.long 0x2
.int changeItemStatus__11MarioAccessFl + 0xF0
lis 3, 0x8000

_kHook53:
.long 0x3
.long 0x1
.long 0x2
.int changeItemStatus__11MarioAccessFl + 0xF4
lwz 3, EMPTYMEM (3)

/* SpinCloudItem */
_kHook54:
.long 0x3
.long 0x1
.long 0x2
.int FUN_803B6FF0 + 0xC
lis 3, 0x8000

_kHook55:
.long 0x3
.long 0x1
.long 0x2
.int FUN_803B6FF0 + 0x10
lwz 3, EMPTYMEM (3)

/* MorphItemRock */
_kHook56:
.long 0x3
.long 0x1
.long 0x2
.int FUN_803B7030 + 0xC
lis 3, 0x8000

_kHook57:
.long 0x3
.long 0x1
.long 0x2
.int FUN_803B7030 + 0x10
lwz 3, EMPTYMEM (3)


/* Yoshi */

/* Other Yoshi eggs don't despawn when one is broken */
_kHook58:
.long 0x3
.long 0x1
.long 0x2
.int FUN_80416720 + 0x80
nop

/* Each player can have their own Yoshi */

_kHook59:
.long 0x3
.long 0x1
.long 0x2
.int FUN_80422790 + 0x1C
lis 3, 0x8000

_kHook60:
.long 0x3
.long 0x1
.long 0x2
.int FUN_80422790 + 0x20
lwz 3, EMPTYMEM (3)

_kHook61:
.long 0x3
.long 0x1
.long 0x2
.int FUN_80422790 + 0x30
lis 3, 0x8000

_kHook62:
.long 0x3
.long 0x1
.long 0x2
.int FUN_80422790 + 0x34
lwz 3, EMPTYMEM (3)

/* Yoshi is mounted by correct player */

_kHook63:
.long 0x3
.long 0x1
.long 0x2
.int FUN_803B6FB0 + 0xC
lis 3, 0x8000

_kHook64:
.long 0x3
.long 0x1
.long 0x2
.int FUN_803B6FB0 + 0x10
lwz 3, EMPTYMEM (3)

/* SuperSpinDriver */

_kHook65:
.long 0x2
.long 0x4
.int FUN_8031FBF0 + 0x60
.long speciallaunchstar

_kHook66:
.long 0x2
.long 0x3
.int startBckPlayer__2MRFPCcPCc
.long otherlaunchstar

_kHook67:
.long 0x2
.long 0x3
.int FUN_8004F640 + 0x14
.long simplelaunchstar

_kHook68:
.long 0x3
.long 0x1
.long 0x2
.int FUN_80320410 + 0x184
cmpwi 3, 0

_kHook69:
.long 0x3
.long 0x1
.long 0x2
.int FUN_80320410 + 0x188
mr 3, 31

_kHook70:
.long 0x3
.long 0x1
.long 0x2
.int FUN_80320410 + 0x18C
addi 4, 1, 8

_kHook71:
.long 0x3
.long 0x1
.long 0x2
.int FUN_80320410 + 0x190
bne- 0xC

_kHook72:
.long 0x3
.long 0x1
.long 0x2
.int FUN_80320410 + 0x194
bl 0x9D59C /* 0x803BDB40 */

_kHook73:
.long 0x3
.long 0x1
.long 0x2
.int FUN_80320410 + 0x198
b 0xC

_kHook74:
.long 0x3
.long 0x1
.long 0x2
.int FUN_80320410 + 0x19C
bl -0x2EEA6C /* 0x80031B40 */

_kHook75:
.long 0x3
.long 0x1
.long 0x2
.int FUN_80320410 + 0x1A0
nop

_kHook76:
.long 0x3
.long 0x1
.long 0x2
.int changeAnimationE__11MarioAccessFPCcPCc + 0x10
mr 31, 5

_kHook77:
.long 0x3
.long 0x1
.long 0x2
.int changeAnimationE__11MarioAccessFPCcPCc + 0x18
mr 30, 3

_kHook78:
.long 0x3
.long 0x1
.long 0x2
.int changeAnimationE__11MarioAccessFPCcPCc + 0x1C
mr 3, 31

_kHook79:
.long 0x3
.long 0x1
.long 0x2
.int changeAnimationE__11MarioAccessFPCcPCc + 0x20
mr 5, 4

_kHook80:
.long 0x3
.long 0x1
.long 0x2
.int changeAnimationE__11MarioAccessFPCcPCc + 0x24
mr 4, 30

_kHook81:
.long 0x3
.long 0x1
.long 0x2
.int changeAnimationE__11MarioAccessFPCcPCc + 0x28
bl 0x8828 /* 0x803BEA60 */

_kHook82:
.long 0x3
.long 0x1
.long 0x2
.int changeAnimationE__11MarioAccessFPCcPCc + 0x2C
mr 3, 31

_kHook83:
.long 0x3
.long 0x1
.long 0x2
.int changeAnimationE__11MarioAccessFPCcPCc + 0x30
mr 4, 30

_kHook84:
.long 0x3
.long 0x1
.long 0x2
.int changeAnimationE__11MarioAccessFPCcPCc + 0x34
bl 0x883C /* 0x803BEA80 */

_kHook85:
.long 0x3
.long 0x1
.long 0x2
.int changeAnimationE__11MarioAccessFPCcPCc + 0x38
nop

_kHook86:
.long 0x3
.long 0x1
.long 0x2
.int changeAnimationE__11MarioAccessFPCcPCc + 0x3C
nop

_kHook87:
.long 0x3
.long 0x1
.long 0x2
.int endRush__11MarioAccessFPC11RushEndInfo
mr 4, 3

_kHook88:
.long 0x3
.long 0x1
.long 0x2
.int endRush__11MarioAccessFPC11RushEndInfo + 0x4
lwz 3, 0x90 (31)

_kHook89:
.long 0x3
.long 0x1
.long 0x2
.int endRush__11MarioAccessFPC11RushEndInfo + 0x8
b 0x1A798 /* 0x803D00D0 */

_kHook90:
.long 0x3
.long 0x1
.long 0x2
.int FUN_8031F0F0 + 0x1C
lbz 31, 0x1098 (27)

_kHook91:
.long 0x3
.long 0x1
.long 0x2
.int FUN_8031F0F0 + 0x28
mr 27, 3

_kHook92:
.long 0x3
.long 0x1
.long 0x2
.int FUN_8031F0F0 + 0x38
beq- 0x1C8

_kHook93:
.long 0x3
.long 0x1
.long 0x2
.int FUN_8031F0F0 + 0x44
bne- 0x10

_kHook94:
.long 0x3
.long 0x1
.long 0x2
.int FUN_8031F0F0 + 0x5C
mr 3, 31

_kHook95:
.long 0x3
.long 0x1
.long 0x2
.int FUN_8031F0F0 + 0x60
li 31, 0

/* RestartObj displays the correct player's flag */
/*_kHook96:
.long 0x3
.long 0x1
.long 0x2
.int FUN_802F1F20 + 0x20
lbz 3, 0x1099 (22)*/


/* Stationed files */

/* Always load Mario's stationed files instead of Luigi's stationed files. */
_kHook97:
.long 0x3
.long 0x1
.long 0x2
.int init__9GameSceneFv + 0x28
li 3, 0

/*
 * Mark Luigi's stationed files except the Cloud Luigi files as Mario's stationed
 * files (the game would run out of memory if it loaded Cloud Luigi's files as well).
 */

_kHook98:
.long 0x3
.long 0x1
.long 0x2
.int cStationedFileInfo__17StationedFileInfo + 0x70
.int 3

_kHook99:
.long 0x3
.long 0x1
.long 0x2
.int cStationedFileInfo__17StationedFileInfo + 0x7C
.int 3

_kHook100:
.long 0x3
.long 0x1
.long 0x2
.int cStationedFileInfo__17StationedFileInfo + 0xA0
.int 3

_kHook101:
.long 0x3
.long 0x1
.long 0x2
.int cStationedFileInfo__17StationedFileInfo + 0xAC
.int 3

_kHook102:
.long 0x3
.long 0x1
.long 0x2
.int cStationedFileInfo__17StationedFileInfo + 0xB8
.int 3

_kHook103:
.long 0x3
.long 0x1
.long 0x2
.int cStationedFileInfo__17StationedFileInfo + 0xC4
.int 3

_kHook104:
.long 0x3
.long 0x1
.long 0x2
.int cStationedFileInfo__17StationedFileInfo + 0xD0
.int 3

/*
 * To save memory, mark the Cloud Mario files in the stationed files table
 * as Luigi's stationed files so they're not loaded. The game will still
 * load these files upon loading a scene that contains Cloud Flowers.
 */
_kHook105:
.long 0x3
.long 0x1
.long 0x2
#if defined(as) || defined(kr)
.int cStationedFileInfo__17StationedFileInfo + 0x10
#else
.int cStationedFileInfo__17StationedFileInfo + 0x1C
#endif
.int 4

_kHook106:
.long 0x3
.long 0x1
.long 0x2
#if defined(as) || defined(kr)
.int cStationedFileInfo__17StationedFileInfo + 0x1C
#else
.int cStationedFileInfo__17StationedFileInfo + 0x28
#endif
.int 4


/* Miscellaneous */

/* Disable the co-star Luma. */
_kHook107:
.long 0x3
.long 0x1
.long 0x2
.int FUN_803217F0 + 0x1C
beq- 0x54

/* Disable LuigiIntrusively */
_kHook108:
.long 0x3
.long 0x1
.long 0x2
.int cCreateTable__14NameObjFactory + 0x44C
.int 0

/* Disable fly-ins */
_kHook109:
.long 0x3
.long 0x1
.long 0x2
.int cCreateTable__14NameObjFactory + 0x1DD4
.int 0

/* Starship Mario changeroom always enabled */
_kHook110:
.long 0x3
.long 0x1
.long 0x2
.int FUN_800248B0
li 3, 1

_kHook111:
.long 0x3
.long 0x1
.long 0x2
.int FUN_800248B0 + 0x4
blr

/* HUD always uses Mario's lives icon */
_kHook112:
.long 0x3
.long 0x1
.long 0x2
.int FUN_80488C90 + 0xA4
b 0x1C

/* Lives-lost screen always uses Mario's lives icon */
_kHook113:
.long 0x3
.long 0x1
.long 0x2
.int FUN_804893F0 + 0x74
b 0x30

#ifdef SPLITSCREEN
/* New standard screen width */
_kHook114:
.long 0x3
.long 0x1
.long 0x2
.int getScreenWidth__2MRFv + 0x14
li 3, 0x130

/* New widescreen screen width */
_kHook115:
.long 0x3
.long 0x1
.long 0x2
.int getScreenWidth__2MRFv + 0x1C
li 3, 0x196

_kHook116:
.long 0x2
.long 0x4
.int clearEfb__17MainLoopFrameworkFiiii8_GXColor + 0xB8
.long drawhalfscreen

_kHook117:
.long 0x2
.long 0x4
.int FUN_80021480 + 0x68
.long drawhalfscreen

_kHook118:
.long 0x2
.long 0x3
.int GXSetScissor
.long drawhalfscreen_scissor

_kHook119:
.long 0x2
.long 0x3
.int frameLoop__10GameSystemFv + 0x64
.long toggleframenumber
#endif
