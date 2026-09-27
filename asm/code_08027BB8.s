	.include "macro.inc"

	.syntax unified

	thumb_func_start RepairMenuItemDraw
RepairMenuItemDraw: @ 0x08027BB8
	push {r4, r5, r6, lr}
	adds r5, r1, #0
	ldr r0, _08027C0C @ =0x0203A85C
	ldrb r0, [r0, #0xd]
	bl GetUnit
	adds r1, r5, #0
	adds r1, #0x3c
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	lsls r1, r1, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	adds r0, r4, #0
	bl IsItemRepairable
	adds r2, r0, #0
	adds r0, r5, #0
	adds r0, #0x34
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	movs r1, #0x2c
	ldrsh r3, [r5, r1]
	lsls r3, r3, #5
	movs r6, #0x2a
	ldrsh r1, [r5, r6]
	adds r3, r3, r1
	lsls r3, r3, #1
	ldr r1, _08027C10 @ =0x02022C60
	adds r3, r3, r1
	adds r1, r4, #0
	bl DrawItemMenuLineLong
	movs r0, #1
	bl EnableBgSync
	movs r0, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08027C0C: .4byte 0x0203A85C
_08027C10: .4byte 0x02022C60
