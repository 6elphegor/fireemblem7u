	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08020158
sub_08020158: @ 0x08020158
	push {r4, r5, r6, lr}
	adds r2, r0, #0
	adds r1, r2, #0
	adds r1, #0x64
	ldrh r3, [r2, #0x34]
	ldrh r4, [r1]
	adds r0, r3, r4
	strh r0, [r1]
	adds r3, r2, #0
	adds r3, #0x66
	ldrh r5, [r2, #0x38]
	ldrh r6, [r3]
	adds r0, r5, r6
	strh r0, [r3]
	adds r4, r2, #0
	adds r4, #0x68
	ldrh r5, [r2, #0x3c]
	ldrh r6, [r4]
	adds r0, r5, r6
	strh r0, [r4]
	adds r5, r2, #0
	adds r5, #0x6a
	ldr r0, [r2, #0x40]
	ldrh r2, [r5]
	adds r0, r2, r0
	strh r0, [r5]
	movs r6, #0
	ldrsh r1, [r1, r6]
	rsbs r1, r1, #0
	lsls r1, r1, #8
	lsrs r1, r1, #0x10
	movs r0, #0
	ldrsh r2, [r3, r0]
	rsbs r2, r2, #0
	lsls r2, r2, #8
	lsrs r2, r2, #0x10
	movs r0, #2
	bl SetBgOffset
	movs r2, #0
	ldrsh r1, [r4, r2]
	rsbs r1, r1, #0
	lsls r1, r1, #8
	lsrs r1, r1, #0x10
	movs r3, #0
	ldrsh r2, [r5, r3]
	rsbs r2, r2, #0
	lsls r2, r2, #8
	lsrs r2, r2, #0x10
	movs r0, #3
	bl SetBgOffset
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
