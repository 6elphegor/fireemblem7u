	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08022A7C
sub_08022A7C: @ 0x08022A7C
	push {r4, r5, lr}
	ldr r5, _08022AB4 @ =0x03004690
	ldr r0, [r5]
	adds r1, #0x3c
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl EquipUnitItemSlot
	ldr r4, _08022AB8 @ =0x0203A85C
	movs r0, #0
	strb r0, [r4, #0x12]
	bl ClearUi
	ldr r0, [r5]
	ldrb r4, [r4, #0x12]
	lsls r2, r4, #1
	adds r1, r0, #0
	adds r1, #0x1e
	adds r1, r1, r2
	ldrh r1, [r1]
	bl DoItemUse
	movs r0, #7
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08022AB4: .4byte 0x03004690
_08022AB8: .4byte 0x0203A85C
