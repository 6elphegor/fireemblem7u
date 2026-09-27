	.include "macro.inc"

	.syntax unified

	thumb_func_start DragonFlamefx_EndRing
DragonFlamefx_EndRing: @ 0x0807B4E8
	push {r4, r5, lr}
	sub sp, #0x14
	adds r4, r0, #0
	adds r0, #0x4c
	movs r5, #0
	strh r5, [r0]
	movs r0, #0
	bl BmBgfxSetLoopEN
	movs r2, #0x80
	lsls r2, r2, #1
	movs r3, #0x80
	lsls r3, r3, #2
	str r3, [sp]
	str r3, [sp, #4]
	movs r0, #0x10
	rsbs r0, r0, #0
	str r0, [sp, #8]
	movs r0, #4
	str r0, [sp, #0xc]
	str r4, [sp, #0x10]
	adds r0, r2, #0
	adds r1, r2, #0
	bl sub_080139D8
	adds r4, #0x64
	strh r5, [r4]
	add sp, #0x14
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
