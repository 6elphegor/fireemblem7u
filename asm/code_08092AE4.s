	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08092AE4
sub_08092AE4: @ 0x08092AE4
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r0, #0x29
	ldrb r0, [r0]
	movs r1, #3
	bl __udivsi3
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x14
	adds r6, r4, #0
	bl PrepGetUnitAmount
	subs r0, #1
	movs r1, #3
	bl __divsi3
	lsls r0, r0, #4
	ldrh r2, [r5, #0x32]
	subs r1, r4, r2
	cmp r1, #0x20
	ble _08092B1E
	cmp r4, r0
	bne _08092B18
	adds r0, r4, #0
	subs r0, #0x30
	b _08092B2E
_08092B18:
	adds r0, r4, #0
	subs r0, #0x20
	b _08092B2E
_08092B1E:
	cmp r1, #0xf
	bgt _08092B30
	cmp r4, #0
	bne _08092B2A
	strh r4, [r5, #0x32]
	b _08092B30
_08092B2A:
	adds r0, r6, #0
	subs r0, #0x10
_08092B2E:
	strh r0, [r5, #0x32]
_08092B30:
	ldr r1, _08092B68 @ =0x0000FFD8
	ldrh r2, [r5, #0x32]
	subs r2, #4
	movs r0, #0xff
	ands r2, r0
	movs r0, #2
	bl SetBgOffset
	ldrh r4, [r5, #0x32]
	bl PrepGetUnitAmount
	subs r0, #1
	movs r1, #3
	bl __divsi3
	adds r2, r0, #0
	adds r2, #1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #6
	adds r1, r4, #0
	movs r3, #4
	bl UpdateMenuScrollBarConfig
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08092B68: .4byte 0x0000FFD8
