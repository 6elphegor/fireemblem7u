	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08091C48
sub_08091C48: @ 0x08091C48
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r0, #0x29
	ldrb r0, [r0]
	movs r1, #3
	bl __udivsi3
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x14
	bl PrepGetUnitAmount
	subs r0, #1
	movs r1, #3
	bl __divsi3
	lsls r2, r0, #4
	ldrh r1, [r6, #0x32]
	subs r0, r7, r1
	cmp r0, #0x20
	ble _08091CE8
	adds r0, r1, #0
	adds r0, #0x30
	cmp r0, r2
	bge _08091CE8
	adds r0, r6, #0
	adds r0, #0x30
	ldrb r0, [r0]
	adds r2, r0, r1
	strh r2, [r6, #0x32]
	ldr r1, _08091D6C @ =0x0000FFD8
	subs r2, #4
	movs r0, #0xff
	ands r2, r0
	movs r0, #2
	bl SetBgOffset
	adds r1, r6, #0
	adds r1, #0x2a
	ldrb r0, [r1]
	cmp r0, #0xff
	beq _08091CC8
	adds r5, r0, #0
	movs r1, #3
	bl __umodsi3
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x12
	adds r4, #0x18
	adds r0, r5, #0
	movs r1, #3
	bl __udivsi3
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x14
	ldrh r0, [r6, #0x32]
	subs r0, #4
	subs r2, r2, r0
	movs r0, #0
	adds r1, r4, #0
	movs r3, #2
	bl SetUiCursorHandConfig
_08091CC8:
	ldrh r4, [r6, #0x32]
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
_08091CE8:
	ldrh r2, [r6, #0x32]
	subs r0, r7, r2
	cmp r0, #0xf
	bgt _08091D64
	cmp r2, #0
	beq _08091D64
	adds r0, r6, #0
	adds r0, #0x30
	ldrb r0, [r0]
	subs r2, r2, r0
	strh r2, [r6, #0x32]
	ldr r1, _08091D6C @ =0x0000FFD8
	subs r2, #4
	movs r0, #0xff
	ands r2, r0
	movs r0, #2
	bl SetBgOffset
	adds r1, r6, #0
	adds r1, #0x2a
	ldrb r0, [r1]
	cmp r0, #0xff
	beq _08091D44
	adds r5, r0, #0
	movs r1, #3
	bl __umodsi3
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x12
	adds r4, #0x18
	adds r0, r5, #0
	movs r1, #3
	bl __udivsi3
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x14
	ldrh r0, [r6, #0x32]
	subs r0, #4
	subs r2, r2, r0
	movs r0, #0
	adds r1, r4, #0
	movs r3, #2
	bl SetUiCursorHandConfig
_08091D44:
	ldrh r4, [r6, #0x32]
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
_08091D64:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08091D6C: .4byte 0x0000FFD8
