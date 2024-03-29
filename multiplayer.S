#include "multiplayer.h"

.section .text

/* Spawn one Mario and one Luigi */

spawntwomarios:
bl	isPlayerLuigi__2MRFv
xori	0, 3, 1
ori	0, 0, 0x0100
lis	3, 0x8000
sth	0, EMPTYMEM + 4 (3)
bl	isStageFileSelect__2MRFv
cmpwi	3, 0
bne-	onemario
bl	isStageWorldMap__2MRFv
cmpwi	3, 0
bne-	onemario
mr	3, 31
bl	initPlacementMario__15StageDataHolderFv
onemario:
lis	3, 0x8000
lbz	0, EMPTYMEM + 5 (3)
xori	0, 0, 1
sth	0, EMPTYMEM + 4 (3)
mr	3, 31
b	initPlacement__15StageDataHolderFv + 0x1C


marioorluigi:
lis	3, 0x8000
lhz	0, EMPTYMEM + 4 (3)
sth	0, 0x1098 (29)
stb	0, -0x24F0 (13)
b	init__10MarioActorFRC12JMapInfoIter + 0x5C


setmarioandluigiplayeractor:
lis	12, 0x8000
lbz	0, EMPTYMEM + 4 (12)
cmpwi	0, 0x1
beq-	playertwo
stw	4, 0x14 (3)
b	init__10MarioActorFRC12JMapInfoIter + 0x29C
playertwo:
stw	4, 0x28 (3)
b	init__10MarioActorFRC12JMapInfoIter + 0x29C


/* Remap controls */

remapjoystickxplayer:
lbz	3, 0x1098 (29)
b	getPlayerStickX__2MRFv


remapjoystickxother:
li	3, 0
b	getPlayerStickX__2MRFv


remapjoystickyplayer:
lbz	3, 0x1098 (29)
b	getPlayerStickY__2MRFv


remapjoystickyother:
li	3, 0
b	getPlayerStickY__2MRFv


/* Save pointer to player that triggered collision */

collisionbackupplayerpointer:
lis	3, 0x8000
stw	28, EMPTYMEM (3)
lbz	0, 0xE3C (28)
b	FUN_803CBDE0 + 0x288
