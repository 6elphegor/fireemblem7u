	.include "macro.inc"

	.syntax unified

	thumb_func_start StartMuFogBump
StartMuFogBump: @ 0x0806C540
	push {r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	ldr r0, _0806C5AC @ =0x083F4730
	ldr r1, _0806C5B0 @ =0x06013000
	bl Decompress
	ldr r1, _0806C5B4 @ =0x083EF9A0
	adds r0, r1, #0
	movs r1, #2
	bl StartSpriteAnim
	str r0, [r7, #0xc]
	ldr r0, [r7, #0xc]
	ldrh r1, [r0, #0x22]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #0x8c
	lsls r3, r3, #5
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0, #0x22]
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	movs r1, #0
	bl SetSpriteAnimId
	ldr r1, _0806C5B8 @ =0x08C9CEA0
	adds r0, r1, #0
	movs r1, #3
	bl Proc_Start
	str r0, [r7, #8]
	ldr r0, [r7, #8]
	ldr r1, [r7, #0xc]
	str r1, [r0, #0x50]
	ldr r0, [r7, #8]
	ldr r1, [r7]
	adds r2, r1, #0
	adds r2, #8
	str r2, [r0, #0x2c]
	ldr r0, [r7, #8]
	ldr r1, [r7, #4]
	subs r2, r1, #4
	str r2, [r0, #0x30]
	add sp, #0x10
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806C5AC: .4byte 0x083F4730
_0806C5B0: .4byte 0x06013000
_0806C5B4: .4byte 0x083EF9A0
_0806C5B8: .4byte 0x08C9CEA0
