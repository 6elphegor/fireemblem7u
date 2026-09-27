	.include "macro.inc"

	.syntax unified

	thumb_func_start DisplaySysHandCursorTextShadow
DisplaySysHandCursorTextShadow: @ 0x080A94A0
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r0, _080A94D8 @ =0x08CE4AC8
	bl Proc_Find
	adds r2, r0, #0
	cmp r2, #0
	beq _080A94D0
	adds r1, r2, #0
	adds r1, #0x34
	movs r0, #0
	strb r0, [r1]
	lsls r0, r5, #0xf
	lsrs r0, r0, #0x14
	strh r0, [r2, #0x36]
	movs r0, #0xf
	ands r4, r0
	strh r4, [r2, #0x3a]
	ldr r0, _080A94DC @ =0x0840E098
	ldr r2, _080A94E0 @ =0x06010000
	adds r1, r5, r2
	bl Decompress
_080A94D0:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A94D8: .4byte 0x08CE4AC8
_080A94DC: .4byte 0x0840E098
_080A94E0: .4byte 0x06010000
