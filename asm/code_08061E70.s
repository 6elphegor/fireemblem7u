	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08061E70
sub_08061E70: @ 0x08061E70
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, _08061EC4 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08061EC8 @ =0x08BA4064
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	ldr r3, _08061ECC @ =0x08BD6CF4
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl EfxCreateFrontAnim
	str r0, [r4, #0x60]
	movs r1, #0x78
	strh r1, [r0, #2]
	movs r1, #0x3c
	strh r1, [r0, #4]
	ldr r1, _08061ED0 @ =0x0000F3FF
	ldrh r2, [r0, #8]
	ands r1, r2
	movs r3, #0xc0
	lsls r3, r3, #4
	adds r2, r3, #0
	orrs r1, r2
	strh r1, [r0, #8]
	movs r1, #0x14
	strh r1, [r0, #0xa]
	bl AnimSort
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08061EC4: .4byte 0x0201774C
_08061EC8: .4byte 0x08BA4064
_08061ECC: .4byte 0x08BD6CF4
_08061ED0: .4byte 0x0000F3FF
