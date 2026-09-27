	.include "macro.inc"

	.syntax unified

	thumb_func_start ClearTalkFaceRefs
ClearTalkFaceRefs: @ 0x08007DD4
	push {r4, lr}
	movs r2, #0
	ldr r4, _08007DF4 @ =0x08B909B8
	movs r3, #0
_08007DDC:
	ldr r0, [r4]
	lsls r1, r2, #2
	adds r0, #0x18
	adds r0, r0, r1
	str r3, [r0]
	adds r2, #1
	cmp r2, #7
	ble _08007DDC
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08007DF4: .4byte 0x08B909B8
