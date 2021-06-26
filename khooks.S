#include "multiplayer.h"

.section .kamek


/* Spawn one Mario and one Luigi */

_kHook1:
.long 0x2
.long 0x3
.int 0x8045B908
.long spawntwomarios

_kHook2:
.long 0x2
.long 0x3
.int 0x803B7874
.long marioorluigi

_kHook3:
.long 0x2
.long 0x3
.int 0x803B7AB8
.long setmarioandluigiplayeractor


/* Remap controls */

/* Jump (A) */
_kHook4:
.long 0x3
.long 0x1
.long 0x2
.int 0x8002ADB8
lbz 3, 0x1098 (30)

/* Jump height, Flying Mario/Luigi hover in place (A) */
_kHook5:
.long 0x3
.long 0x1
.long 0x2
.int 0x8002AE78
lbz 3, 0x1098 (30)

/* Yoshi flutter jump (A) */
_kHook6:
.long 0x3
.long 0x1
.long 0x2
.int 0x803B149C
lbz 3, 0x1098 (31)

/* Unknown (B) */
_kHook7:
.long 0x3
.long 0x1
.long 0x2
.int 0x8002ADE8
lbz 3, 0x1098 (30)

/* Crouch (Z) */
_kHook8:
.long 0x3
.long 0x1
.long 0x2
.int 0x8002AED8
lbz 3, 0x1098 (30)

/* Ground pound, stop Flying Mario/Luigi flight (Z) */
_kHook9:
.long 0x3
.long 0x1
.long 0x2
.int 0x8002AE18
lbz 3, 0x1098 (30)

/* Exit first-person (D-Pad down) */
/*_kHook10:
.long 0x3
.long 0x1
.long 0x2
.int 0x8002ABB8
mr 3, 17*/

/* Unknown (C) */
_kHook11:
.long 0x3
.long 0x1
.long 0x2
.int 0x8002AE48
lbz 3, 0x1098 (30)

/* Unknown (C) */
_kHook12:
.long 0x3
.long 0x1
.long 0x2
.int 0x80387CE0
lbz 3, 0x1098 (30)

/* Spin (accelerometer) */
_kHook13:
.long 0x3
.long 0x1
.long 0x2
.int 0x803CDFF8
lbz 3, 0x1098 (30)

/* Spin during Flying Mario/Luigi flight (accelerometer) */
_kHook14:
.long 0x3
.long 0x1
.long 0x2
.int 0x803CDFE8
lbz 3, 0x1098 (30)

/* Nunchuk spin (nunchuk accelerometer) */
_kHook15:
.long 0x3
.long 0x1
.long 0x2
.int 0x803CE0E8
lbz 3, 0x1098 (30)

/* Nunchuk joystick X-axis */

_kHook16:
.long 0x3
.long 0x1
.long 0x2
.int 0x8002AC24
nop

_kHook17:
.long 0x2
.long 0x4
.int 0x803BDC54
.long remapjoystickxplayer

_kHook18:
.long 0x2
.long 0x4
.int 0x8007D9E4
.long remapjoystickxother

_kHook19:
.long 0x2
.long 0x4
.int 0x8007D9EC
.long remapjoystickxother

_kHook20:
.long 0x2
.long 0x4
.int 0x8007DAB0
.long remapjoystickxother

_kHook21:
.long 0x2
.long 0x4
.int 0x8007DAB8
.long remapjoystickxother

_kHook22:
.long 0x2
.long 0x4
.int 0x804E12C4
.long remapjoystickxother

_kHook23:
.long 0x2
.long 0x4
.int 0x804F6104
.long remapjoystickxother

_kHook24:
.long 0x2
.long 0x4
.int 0x804F6698
.long remapjoystickxother

/* Nunchuk joystick Y-axis */

_kHook25:
.long 0x3
.long 0x1
.long 0x2
.int 0x8002AD04
nop

_kHook26:
.long 0x2
.long 0x4
.int 0x803BDC64
.long remapjoystickyplayer

_kHook27:
.long 0x2
.long 0x4
.int 0x8007D9F4
.long remapjoystickyother

_kHook28:
.long 0x2
.long 0x4
.int 0x8007D9FC
.long remapjoystickyother

_kHook29:
.long 0x2
.long 0x4
.int 0x8007DAC0
.long remapjoystickyother

_kHook30:
.long 0x2
.long 0x4
.int 0x8007DAC8
.long remapjoystickyother

_kHook31:
.long 0x2
.long 0x4
.int 0x804E12B8
.long remapjoystickyother

_kHook32:
.long 0x2
.long 0x4
.int 0x804F610C
.long remapjoystickyother

_kHook33:
.long 0x2
.long 0x4
.int 0x804F668C
.long remapjoystickyother


/* New size of the MarioActor class. */
_kHook34:
.long 0x3
.long 0x1
.long 0x2
.int 0x8033BB14
li 3, 0x109A

/* New size of the MarioHolder class. */
_kHook35:
.long 0x3
.long 0x1
.long 0x2
.int 0x80459CAC
li 3, 0x2C


/* Teleportation and camera */
_kHook36:
.long 0x3
.long 0x1
.long 0x1
#ifdef EU
.int 0x806CCB98
#elif defined(JP)
.int 0x806C6C78
#else /* US */
.int 0x806C7498
#endif
.long handleteleportandcamera


/* Increase functionallity with player 2 */

/* Save pointer to player that triggered collision */
_kHook37:
.long 0x2
.long 0x3
.int 0x803CC064
.long collisionbackupplayerpointer

/* Coins increment correct player's health */
_kHook38:
.long 0x3
.long 0x1
.long 0x2
.int 0x803B5A8C
lis 3, 0x8000

_kHook39:
.long 0x3
.long 0x1
.long 0x2
.int 0x803B5A90
lwz 3, EMPTYMEM (3)

/* MorphItemNeoHopper */
_kHook40:
.long 0x3
.long 0x1
.long 0x2
.int 0x803B6E08
lis 3, 0x8000

_kHook41:
.long 0x3
.long 0x1
.long 0x2
.int 0x803B6E0C
lwz 3, EMPTYMEM (3)

/* MorphItemNeoBee */
_kHook42:
.long 0x3
.long 0x1
.long 0x2
.int 0x803B6E24
lis 3, 0x8000

_kHook43:
.long 0x3
.long 0x1
.long 0x2
.int 0x803B6E28
lwz 3, EMPTYMEM (3)

/* MorphItemNeoTeresa */
_kHook44:
.long 0x3
.long 0x1
.long 0x2
.int 0x803B6E40
lis 3, 0x8000

_kHook45:
.long 0x3
.long 0x1
.long 0x2
.int 0x803B6E44
lwz 3, EMPTYMEM (3)

/* MorphItemNeoIce */
_kHook46:
.long 0x3
.long 0x1
.long 0x2
.int 0x803B6E5C
lis 3, 0x8000

_kHook47:
.long 0x3
.long 0x1
.long 0x2
.int 0x803B6E60
lwz 3, EMPTYMEM (3)

/* MorphItemNeoFire */
_kHook48:
.long 0x3
.long 0x1
.long 0x2
.int 0x803B6E78
lis 3, 0x8000

_kHook49:
.long 0x3
.long 0x1
.long 0x2
.int 0x803B6E7C
lwz 3, EMPTYMEM (3)

/* MorphItemNeoFoo */
_kHook50:
.long 0x3
.long 0x1
.long 0x2
.int 0x803B6E94
lis 3, 0x8000

_kHook51:
.long 0x3
.long 0x1
.long 0x2
.int 0x803B6E98
lwz 3, EMPTYMEM (3)

/* BenefitItemInvincible */
_kHook52:
.long 0x3
.long 0x1
.long 0x2
.int 0x803B6EB0
lis 3, 0x8000

_kHook53:
.long 0x3
.long 0x1
.long 0x2
.int 0x803B6EB4
lwz 3, EMPTYMEM (3)

/* SpinCloudItem */
_kHook54:
.long 0x3
.long 0x1
.long 0x2
.int 0x803B6FFC
lis 3, 0x8000

_kHook55:
.long 0x3
.long 0x1
.long 0x2
.int 0x803B7000
lwz 3, EMPTYMEM (3)

/* MorphItemRock */
_kHook56:
.long 0x3
.long 0x1
.long 0x2
.int 0x803B703C
lis 3, 0x8000

_kHook57:
.long 0x3
.long 0x1
.long 0x2
.int 0x803B7040
lwz 3, EMPTYMEM (3)


/* Yoshi */

/* Other Yoshi eggs don't despawn when one is broken */
_kHook58:
.long 0x3
.long 0x1
.long 0x2
.int 0x804167A0
nop

/* Each player can have their own Yoshi */

_kHook59:
.long 0x3
.long 0x1
.long 0x2
.int 0x804227AC
lis 3, 0x8000

_kHook60:
.long 0x3
.long 0x1
.long 0x2
.int 0x804227B0
lwz 3, EMPTYMEM (3)

_kHook61:
.long 0x3
.long 0x1
.long 0x2
.int 0x804227C0
lis 3, 0x8000

_kHook62:
.long 0x3
.long 0x1
.long 0x2
.int 0x804227C4
lwz 3, EMPTYMEM (3)

/* Yoshi is mounted by correct player */

_kHook63:
.long 0x3
.long 0x1
.long 0x2
.int 0x803B6FBC
lis 3, 0x8000

_kHook64:
.long 0x3
.long 0x1
.long 0x2
.int 0x803B6FC0
lwz 3, EMPTYMEM (3)

/* SuperSpinDriver */

_kHook65:
.long 0x2
.long 0x4
.int 0x8031FC50
.long speciallaunchstar

_kHook66:
.long 0x2
.long 0x3
.int 0x8004F5A0
.long otherlaunchstar

_kHook67:
.long 0x2
.long 0x3
.int 0x8004F654
.long simplelaunchstar

_kHook68:
.long 0x3
.long 0x1
.long 0x2
.int 0x80320594
cmpwi 3, 0

_kHook69:
.long 0x3
.long 0x1
.long 0x2
.int 0x80320598
mr 3, 31

_kHook70:
.long 0x3
.long 0x1
.long 0x2
.int 0x8032059C
addi 4, 1, 8

_kHook71:
.long 0x3
.long 0x1
.long 0x2
.int 0x803205A0
bne- 0xC

_kHook72:
.long 0x3
.long 0x1
.long 0x2
.int 0x803205A4
bl 0x9D59C /* 0x803BDB40 */

_kHook73:
.long 0x3
.long 0x1
.long 0x2
.int 0x803205A8
b 0xC

_kHook74:
.long 0x3
.long 0x1
.long 0x2
.int 0x803205AC
bl -0x2EEA6C /* 0x80031B40 */

_kHook75:
.long 0x3
.long 0x1
.long 0x2
.int 0x803205B0
nop

_kHook76:
.long 0x3
.long 0x1
.long 0x2
.int 0x803B6220
mr 31, 5

_kHook77:
.long 0x3
.long 0x1
.long 0x2
.int 0x803B6228
mr 30, 3

_kHook78:
.long 0x3
.long 0x1
.long 0x2
.int 0x803B622C
mr 3, 31

_kHook79:
.long 0x3
.long 0x1
.long 0x2
.int 0x803B6230
mr 5, 4

_kHook80:
.long 0x3
.long 0x1
.long 0x2
.int 0x803B6234
mr 4, 30

_kHook81:
.long 0x3
.long 0x1
.long 0x2
.int 0x803B6238
bl 0x8828 /* 0x803BEA60 */

_kHook82:
.long 0x3
.long 0x1
.long 0x2
.int 0x803B623C
mr 3, 31

_kHook83:
.long 0x3
.long 0x1
.long 0x2
.int 0x803B6240
mr 4, 30

_kHook84:
.long 0x3
.long 0x1
.long 0x2
.int 0x803B6244
bl 0x883C /* 0x803BEA80 */

_kHook85:
.long 0x3
.long 0x1
.long 0x2
.int 0x803B6248
nop

_kHook86:
.long 0x3
.long 0x1
.long 0x2
.int 0x803B624C
nop

_kHook87:
.long 0x3
.long 0x1
.long 0x2
.int 0x803B5930
mr 4, 3

_kHook88:
.long 0x3
.long 0x1
.long 0x2
.int 0x803B5934
lwz 3, 0x90 (31)

_kHook89:
.long 0x3
.long 0x1
.long 0x2
.int 0x803B5938
b 0x1A798 /* 0x803D00D0 */

_kHook90:
.long 0x3
.long 0x1
.long 0x2
.int 0x8031F10C
lbz 31, 0x1098 (27)

_kHook91:
.long 0x3
.long 0x1
.long 0x2
.int 0x8031F118
mr 27, 3

_kHook92:
.long 0x3
.long 0x1
.long 0x2
.int 0x8031F128
beq- 0x1C8

_kHook93:
.long 0x3
.long 0x1
.long 0x2
.int 0x8031F134
bne- 0x10

_kHook94:
.long 0x3
.long 0x1
.long 0x2
.int 0x8031F14C
mr 3, 31

_kHook95:
.long 0x3
.long 0x1
.long 0x2
.int 0x8031F150
li 31, 0

/* RestartObj displays the correct player's flag */
/*_kHook96:
.long 0x3
.long 0x1
.long 0x2
.int 0x802F1F40
lbz 3, 0x1099 (22)*/


/* Stationed files */

/* Always load Mario's stationed files instead of Luigi's stationed files. */
_kHook97:
.long 0x3
.long 0x1
.long 0x2
.int 0x804514A8
li 3, 0

/*
 * Mark Luigi's stationed files except the Cloud Luigi files as Mario's stationed
 * files (the game would run out of memory if it loaded Cloud Luigi's files as well).
 */

_kHook98:
.long 0x3
.long 0x1
.long 0x2
.int 0x8064D2E8
.int 3

_kHook99:
.long 0x3
.long 0x1
.long 0x2
.int 0x8064D2F4
.int 3

_kHook100:
.long 0x3
.long 0x1
.long 0x2
.int 0x8064D318
.int 3

_kHook101:
.long 0x3
.long 0x1
.long 0x2
.int 0x8064D324
.int 3

_kHook102:
.long 0x3
.long 0x1
.long 0x2
.int 0x8064D330
.int 3

_kHook103:
.long 0x3
.long 0x1
.long 0x2
.int 0x8064D33C
.int 3

_kHook104:
.long 0x3
.long 0x1
.long 0x2
.int 0x8064D348
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
.int 0x8064D294
.int 4

_kHook106:
.long 0x3
.long 0x1
.long 0x2
.int 0x8064D2A0
.int 4


/* Miscellaneous */

/* Disable the co-star Luma. */
_kHook107:
.long 0x3
.long 0x1
.long 0x2
.int 0x8032180C
beq- 0x54

/* Disable LuigiIntrusively */
_kHook108:
.long 0x3
.long 0x1
.long 0x2
.int 0x80649DBC
.int 0

/* Disable fly-ins */
_kHook109:
.long 0x3
.long 0x1
.long 0x2
.int 0x8064B744
.int 0

/* Starship Mario changeroom always enabled */
_kHook110:
.long 0x3
.long 0x1
.long 0x2
.int 0x800248B0
li 3, 1

_kHook111:
.long 0x3
.long 0x1
.long 0x2
.int 0x800248B4
blr

/* HUD always uses Mario's lives icon */
_kHook112:
.long 0x3
.long 0x1
.long 0x2
.int 0x80488D34
b 0x1C

/* Lives-lost screen always uses Mario's lives icon */
_kHook113:
.long 0x3
.long 0x1
.long 0x2
.int 0x80489464
b 0x30
