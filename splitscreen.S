#include "multiplayer.h"

drawhalfscreen:
lis	3, 0x8000
lbz	3, EMPTYMEM + 6 (3)
lfs	2, -0x7D74 (2)
fdivs	3, 3, 2
fmr	2, 1
cmpwi	3, 0
beq-	leftscreen
fadds	1, 1, 3
leftscreen:
b	GXSetViewport

toggleframenumber:
lis	3, 0x8000
lbzu	4, EMPTYMEM + 6 (3)
xori	4, 4, 1
stb	4, 0 (3)
blr
