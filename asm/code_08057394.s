	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08057394
sub_08057394: @ 0x08057394
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, _080573E8 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _080573EC @ =0x08BA17F4
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r7, #0
	movs r0, #0
	strh r0, [r4, #0x2c]
	ldr r3, _080573F0 @ =0x08BA5D9C
	ldr r2, _080573F4 @ =0x08BA5E38
	str r2, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	bl EfxCreateFrontAnim
	adds r6, r0, #0
	str r6, [r4, #0x60]
	ldrh r0, [r6, #4]
	adds r0, #0x10
	strh r0, [r6, #4]
	movs r0, #0xc0
	lsls r0, r0, #4
	ldrh r1, [r6, #8]
	ands r0, r1
	strh r0, [r6, #8]
	adds r0, r5, #0
	bl GetAnimPosition
	cmp r0, #1
	bne _080573F8
	movs r1, #0xe4
	lsls r1, r1, #7
	b _080573FC
	.align 2, 0
_080573E8: .4byte 0x0201774C
_080573EC: .4byte 0x08BA17F4
_080573F0: .4byte 0x08BA5D9C
_080573F4: .4byte 0x08BA5E38
_080573F8:
	movs r1, #0x93
	lsls r1, r1, #8
_080573FC:
	adds r0, r1, #0
	ldrh r1, [r6, #8]
	orrs r0, r1
	strh r0, [r6, #8]
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
