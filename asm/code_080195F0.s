	.include "macro.inc"

	.syntax unified

	thumb_func_start UpdateBmMapDisplay
UpdateBmMapDisplay: @ 0x080195F0
	push {r4, r5, lr}
	ldr r2, _08019620 @ =0x0202BBB8
	ldrh r4, [r2, #0xc]
	movs r0, #0xc
	ldrsh r3, [r2, r0]
	ldrh r0, [r2, #0x10]
	movs r5, #0x10
	ldrsh r1, [r2, r5]
	cmp r3, r1
	beq _08019634
	cmp r3, r1
	ble _08019624
	adds r0, r3, #0
	subs r0, #1
	subs r1, #1
	eors r0, r1
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08019634
	movs r0, #0xf
	bl RenderBmMapColumn
	b _08019634
	.align 2, 0
_08019620: .4byte 0x0202BBB8
_08019624:
	eors r0, r4
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08019634
	movs r0, #0
	bl RenderBmMapColumn
_08019634:
	ldr r2, _08019664 @ =0x0202BBB8
	ldrh r4, [r2, #0xe]
	movs r5, #0xe
	ldrsh r3, [r2, r5]
	ldrh r0, [r2, #0x12]
	movs r5, #0x12
	ldrsh r1, [r2, r5]
	cmp r3, r1
	beq _08019678
	cmp r3, r1
	ble _08019668
	adds r0, r3, #0
	subs r0, #1
	subs r1, #1
	eors r0, r1
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08019678
	movs r0, #0xa
	bl RenderBmMapLine
	b _08019678
	.align 2, 0
_08019664: .4byte 0x0202BBB8
_08019668:
	eors r0, r4
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08019678
	movs r0, #0
	bl RenderBmMapLine
_08019678:
	ldr r4, _080196CC @ =0x0202BBB8
	ldr r0, [r4, #0xc]
	str r0, [r4, #0x10]
	ldrh r5, [r4, #0x24]
	lsls r1, r5, #4
	ldrh r0, [r4, #0xc]
	subs r1, r0, r1
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldrh r3, [r4, #0x26]
	lsls r2, r3, #4
	ldrh r5, [r4, #0xe]
	subs r2, r5, r2
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #3
	bl SetBgOffset
	movs r0, #1
	ldrb r1, [r4, #4]
	ands r0, r1
	cmp r0, #0
	beq _080196C4
	ldrh r3, [r4, #0x24]
	lsls r1, r3, #4
	ldrh r5, [r4, #0xc]
	subs r1, r5, r1
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldrh r0, [r4, #0x26]
	lsls r2, r0, #4
	ldrh r4, [r4, #0xe]
	subs r2, r4, r2
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	bl SetBgOffset
_080196C4:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080196CC: .4byte 0x0202BBB8
