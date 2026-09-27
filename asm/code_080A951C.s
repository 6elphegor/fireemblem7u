	.include "macro.inc"

	.syntax unified

	thumb_func_start ShowSysHandCursor
ShowSysHandCursor: @ 0x080A951C
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r4, r2, #0
	lsls r3, r3, #0x10
	lsrs r7, r3, #0x10
	ldr r0, _080A9544 @ =0x08CE4AC8
	bl Proc_Find
	adds r1, r0, #0
	cmp r1, #0
	beq _080A955C
	str r5, [r1, #0x2c]
	str r6, [r1, #0x30]
	cmp r4, #0
	bne _080A9548
	adds r0, #0x35
	strb r4, [r0]
	b _080A9554
	.align 2, 0
_080A9544: .4byte 0x08CE4AC8
_080A9548:
	adds r2, r1, #0
	adds r2, #0x35
	movs r0, #1
	strb r0, [r2]
	strh r4, [r1, #0x38]
	strh r7, [r1, #0x3c]
_080A9554:
	adds r0, r1, #0
	movs r1, #1
	bl Proc_Goto
_080A955C:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
