	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080AD660
sub_080AD660: @ 0x080AD660
	push {r4, r5, r6, r7, lr}
	adds r2, r0, #0
	adds r2, #0x2a
	ldr r1, _080AD6A0 @ =0x08CE5788
	ldr r1, [r1]
	ldrb r2, [r2]
	lsls r3, r2, #3
	adds r3, r3, r1
	ldr r7, [r3, #4]
	ldr r2, _080AD6A4 @ =0x08CE577C
	adds r6, r0, #0
	adds r6, #0x29
	ldrb r4, [r6]
	lsls r1, r4, #2
	ldr r0, [r2]
	adds r0, r0, r1
	movs r2, #0
	ldrsb r2, [r0, r2]
	ldr r0, _080AD6A8 @ =0x08CE5774
	ldr r1, [r0]
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r1, r1, r0
	ldrb r5, [r1, #2]
	movs r0, #0
	ldrsb r0, [r3, r0]
	cmp r0, #0
	bne _080AD6AC
	movs r0, #0
	b _080AD6DC
	.align 2, 0
_080AD6A0: .4byte 0x08CE5788
_080AD6A4: .4byte 0x08CE577C
_080AD6A8: .4byte 0x08CE5774
_080AD6AC:
	adds r0, r4, #0
	bl SetBonusItemClaimed
	ldrb r0, [r6]
	bl sub_080ACCF4
	ldr r0, [r7]
	ldrb r0, [r0, #4]
	cmp r0, #0x28
	bne _080AD6CC
	adds r0, r5, #0
	bl MakeNewItem
	bl AddItemToConvoy
	b _080AD6DA
_080AD6CC:
	adds r0, r5, #0
	bl MakeNewItem
	adds r1, r0, #0
	adds r0, r7, #0
	bl UnitAddItem
_080AD6DA:
	movs r0, #1
_080AD6DC:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
