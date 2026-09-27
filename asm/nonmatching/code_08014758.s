	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08014758
sub_08014758: @ 0x08014758
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x36]
	adds r0, #1
	strh r0, [r4, #0x36]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r1, [r4, #0x34]
	cmp r0, r1
	blo _080147B4
	movs r0, #0
	strh r0, [r4, #0x36]
	ldrh r0, [r4, #0x38]
	ldrh r1, [r4, #0x32]
	bl DivRem
	adds r5, r0, #0
	ldrh r0, [r4, #0x3a]
	cmp r0, #0
	beq _08014786
	ldrh r2, [r4, #0x32]
	subs r0, r2, r5
	subs r5, r0, #1
_08014786:
	lsls r6, r5, #1
	ldr r0, [r4, #0x2c]
	adds r0, r0, r6
	ldrh r1, [r4, #0x30]
	ldrh r3, [r4, #0x32]
	subs r2, r3, r5
	lsls r2, r2, #1
	bl ApplyPaletteExt
	cmp r5, #0
	ble _080147AE
	ldr r0, [r4, #0x2c]
	ldrh r2, [r4, #0x32]
	lsls r1, r2, #1
	ldrh r3, [r4, #0x30]
	adds r1, r3, r1
	subs r1, r1, r6
	adds r2, r6, #0
	bl ApplyPaletteExt
_080147AE:
	ldrh r0, [r4, #0x38]
	adds r0, #1
	strh r0, [r4, #0x38]
_080147B4:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
