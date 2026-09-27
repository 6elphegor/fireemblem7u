	.include "macro.inc"

	.syntax unified

	thumb_func_start ItemMenu_DrawOtherCommands
ItemMenu_DrawOtherCommands: @ 0x08023724
	push {r4, lr}
	adds r2, r1, #0
	ldr r0, _08023764 @ =0x03004690
	ldr r1, [r0]
	adds r0, r2, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, #1
	lsls r0, r0, #1
	adds r1, #0x1e
	adds r1, r1, r0
	ldrh r1, [r1]
	adds r0, r2, #0
	adds r0, #0x34
	movs r4, #0x2c
	ldrsh r3, [r2, r4]
	lsls r3, r3, #5
	movs r4, #0x2a
	ldrsh r2, [r2, r4]
	adds r3, r3, r2
	lsls r3, r3, #1
	ldr r2, _08023768 @ =0x02022C60
	adds r3, r3, r2
	movs r2, #1
	bl DrawItemMenuLine
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08023764: .4byte 0x03004690
_08023768: .4byte 0x02022C60
