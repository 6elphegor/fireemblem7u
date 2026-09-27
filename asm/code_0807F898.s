	.include "macro.inc"

	.syntax unified

	thumb_func_start BackgroundSlide_Loop
BackgroundSlide_Loop: @ 0x0807F898
	push {r4, lr}
	adds r4, r0, #0
	adds r4, #0x4c
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	movs r0, #0
	ldrsh r1, [r4, r0]
	cmp r1, #0
	bge _0807F8AE
	adds r1, #3
_0807F8AE:
	lsls r1, r1, #0xe
	lsrs r1, r1, #0x10
	movs r0, #3
	movs r2, #0
	bl SetBgOffset
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bge _0807F8C4
	adds r0, #3
_0807F8C4:
	asrs r1, r0, #2
	ldr r0, _0807F8D0 @ =0x0400001C
	strh r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0807F8D0: .4byte 0x0400001C
