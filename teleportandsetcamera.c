#include <stddef.h>
#include <stdbool.h>

#include "multiplayer.h"

struct position {
	float x;
	float y;
	float z;
};

struct MarioActor {
	char unk1[0x14];
	struct position pos;
	char unk2[0x564];
	void *doPointWarpPointer;
	char unk3[0xB10];
	// custom:
	char mariono;
	bool isLuigi;
};

struct MarioHolder {
	char unk1[0x14];
	struct MarioActor *Player1;
	char unk2[0x10];
	struct MarioActor *Player2;
};

extern void control__10MarioActorFv(struct MarioActor *mario);
extern void doPointWarpRecovery(void *mariototeleport, struct position *pos, void *unk);
extern int **getWPad__2MRFl(int wiimoteno);
extern char *getSceneObjHolder__2MRFv(void);
extern void *getObj__14SceneObjHolderCFi(void *objholder, int obj);

void handleteleportandcamera(struct MarioActor *thismario) {
	int inputs = getWPad__2MRFl(thismario->mariono)[2][1];
	bool teleport = (inputs >> 9 & 1); // whether 1 is pressed
	bool changecamera = (inputs >> 8 & 1); // whether 2 is pressed

	if (teleport || changecamera) {
		void *SceneObjHolder = getSceneObjHolder__2MRFv();

		if (teleport) {
			struct MarioHolder *marioholder = getObj__14SceneObjHolderCFi(SceneObjHolder, 0x15);
			struct MarioActor *othermario = marioholder->Player1;

			if (othermario == NULL || othermario == thismario)
				othermario = marioholder->Player2;

			if (othermario && othermario != thismario) {
#ifdef BUBBLE
				doPointWarpRecovery(thismario->doPointWarpPointer,
				                    &(othermario->pos),
				                    (void *)0x80000000 + EMPTYMEM + 0x20 /* don't know what this is, so just point it to empty memory and it won't crash */);
#else
				thismario->pos.x = othermario->pos.x;
				thismario->pos.y = othermario->pos.y;
				thismario->pos.z = othermario->pos.z;
#endif
			}
		}

		if (changecamera) {
			char **obj1 = getObj__14SceneObjHolderCFi(SceneObjHolder, 0x3A);
			// occasionally these addresses are 0, so check
			if (obj1 >= (char **)0x80000000) {
				char *obj2 = *(obj1 + 0x5);
				if (obj2 >= (char *)0x80000000) {
					*((struct MarioActor **)(obj2 + 0x14)) = thismario;
				}
			}
		}
	}

	control__10MarioActorFv(thismario);
}
