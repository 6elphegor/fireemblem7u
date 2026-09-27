	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080459F0
sub_080459F0: @ 0x080459F0
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r0, _08045A28 @ =0x03004690
	ldr r0, [r0]
	ldr r6, _08045A2C @ =0x0203DC9C
	ldrb r2, [r6, #7]
	lsls r1, r2, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r5, [r0]
	bl GetGameLock
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r4, #0x64
	strh r0, [r4]
	adds r0, r5, #0
	bl GetItemMinRange
	cmp r0, #1
	bne _08045A30
	adds r0, r5, #0
	bl GetItemMaxRange
	cmp r0, #1
	bne _08045A30
	strb r0, [r6, #6]
	b _08045AB2
	.align 2, 0
_08045A28: .4byte 0x03004690
_08045A2C: .4byte 0x0203DC9C
_08045A30:
	adds r0, r5, #0
	bl GetItemMinRange
	cmp r0, #2
	bne _08045A50
	adds r0, r5, #0
	bl GetItemMaxRange
	adds r1, r0, #0
	cmp r1, #2
	bne _08045A50
	ldr r0, _08045A4C @ =0x0203DC9C
	strb r1, [r0, #6]
	b _08045AB2
	.align 2, 0
_08045A4C: .4byte 0x0203DC9C
_08045A50:
	adds r0, r5, #0
	bl GetItemMinRange
	adds r4, r0, #0
	cmp r4, #2
	bne _08045A70
	adds r0, r5, #0
	bl GetItemMaxRange
	cmp r0, #3
	bne _08045A70
	ldr r0, _08045A6C @ =0x0203DC9C
	strb r4, [r0, #6]
	b _08045AB2
	.align 2, 0
_08045A6C: .4byte 0x0203DC9C
_08045A70:
	ldr r0, _08045A90 @ =0x03001400
	ldr r4, _08045A94 @ =0x0203DC9C
	ldrb r1, [r4, #5]
	adds r0, r1, r0
	ldrb r0, [r0]
	bl GetUnit
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0
	bne _08045A98
	movs r0, #1
	strb r0, [r4, #6]
	b _08045AB2
	.align 2, 0
_08045A90: .4byte 0x03001400
_08045A94: .4byte 0x0203DC9C
_08045A98:
	adds r0, r5, #0
	bl GetItemMinRange
	cmp r0, #1
	ble _08045AA8
	movs r0, #2
	strb r0, [r4, #6]
	b _08045AB2
_08045AA8:
	movs r0, #1
	strb r0, [r4, #6]
	movs r0, #4
	bl ApplyIconPalettes
_08045AB2:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
