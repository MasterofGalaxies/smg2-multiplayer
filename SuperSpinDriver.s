speciallaunchstar:
cmpwi	4, 0
bne-	twoargs1
mr	4, 3
twoargs1:
lwz	5, 0x90 (30)
b	changeAnimationE__11MarioAccessFPCcPCc


otherlaunchstar:
stwu	1, -0x10 (1)
mflr	0
stw	0, 0x14 (1)
stw	30, 0x8 (1)
mr	30, 3
stw	31, 0xC (1)
mr.	31, 4
bne-	twoargs2
mr	31, 3
twoargs2:
bl	getPlayerActor__11MarioAccessFv
mr	5, 3
mr	3, 30
mr	4, 31
lwz	31, 0xC (1)
lwz	30, 0x8 (1)
lwz	0, 0x14 (1)
mtlr	0
addi	1, 1, 0x10
b	changeAnimationE__11MarioAccessFPCcPCc


simplelaunchstar:
bl	getPlayerActor__11MarioAccessFv
mr	5, 3
mr	3, 31
mr	4, 31
b	LAB_8004F658
