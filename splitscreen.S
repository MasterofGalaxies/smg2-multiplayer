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

drawhalfscreen_scissor:
srawi	5, 5, 1
addze	5, 5
lis	8, 0x8000
lbz	8, EMPTYMEM + 6 (8)
cmpwi	8, 0
beq-	leftscreen_scissor
add	3, 3, 5
leftscreen_scissor:
/* instruction that got overwritten by our branch */
#if defined(as) || defined(kr)
lwz	8, 0x3B10 (2)
#else
lwz	8, 0x3B00 (2)
#endif
b	GXSetScissor + 4

toggleframenumber:
lis	3, 0x8000
lbzu	4, EMPTYMEM + 6 (3)
xori	4, 4, 1
stb	4, 0 (3)
blr
