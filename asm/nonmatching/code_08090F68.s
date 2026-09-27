	.include "macro.inc"

	.syntax unified

	thumb_func_start GetPrepPageForItem
GetPrepPageForItem: @ 0x08090F68
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r5, #0
	ldr r4, _08090F88 @ =0x08CC440C
_08090F70:
	adds r0, r6, #0
	bl GetItemType
	ldrb r1, [r4]
	cmp r0, r1
	blt _08090F8C
	ldrb r1, [r4, #1]
	cmp r0, r1
	bgt _08090F8C
	adds r0, r5, #0
	b _08090F96
	.align 2, 0
_08090F88: .4byte 0x08CC440C
_08090F8C:
	adds r4, #4
	adds r5, #1
	cmp r5, #8
	ble _08090F70
	movs r0, #8
_08090F96:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
