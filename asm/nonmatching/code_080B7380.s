	.include "macro.inc"

	.syntax unified

	thumb_func_start EpilogueScroll_Loop
EpilogueScroll_Loop: @ 0x080B7380
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r6, r4, #0
	adds r6, #0x44
	ldrh r1, [r6]
	lsls r0, r1, #0x10
	adds r5, r4, #0
	adds r5, #0x4a
	asrs r3, r0, #0x17
	movs r1, #0
	ldrsh r0, [r5, r1]
	cmp r3, r0
	beq _080B73C8
	ldr r2, [r4, #0x38]
	ldr r1, [r2]
	cmp r1, #0
	bne _080B73AA
	adds r0, r4, #0
	bl Proc_Break
	b _080B73E4
_080B73AA:
	adds r0, r3, #0
	adds r0, #0xa
	ldr r2, [r2, #4]
	bl EpiloguePutBgRow
	ldr r0, [r4, #0x38]
	adds r0, #8
	str r0, [r4, #0x38]
	movs r0, #8
	bl EnableBgSync
	ldrh r6, [r6]
	lsls r0, r6, #0x10
	asrs r0, r0, #0x17
	strh r0, [r5]
_080B73C8:
	adds r0, r4, #0
	adds r0, #0x44
	ldrh r1, [r0]
	ldrh r4, [r4, #0x3c]
	adds r2, r1, r4
	strh r2, [r0]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x13
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #3
	movs r1, #0
	bl SetBgOffset
_080B73E4:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
