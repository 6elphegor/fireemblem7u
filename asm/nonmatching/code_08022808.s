	.include "macro.inc"

	.syntax unified

	thumb_func_start BallistaRangeMenu_Draw
BallistaRangeMenu_Draw: @ 0x08022808
	push {r4, r5, lr}
	adds r4, r1, #0
	movs r5, #0
	adds r0, r4, #0
	adds r0, #0x3d
	ldrb r0, [r0]
	cmp r0, #1
	bne _0802281A
	movs r5, #1
_0802281A:
	ldr r0, _08022850 @ =0x03004690
	ldr r1, [r0]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl GetBallistaItemAt
	adds r1, r0, #0
	adds r0, r4, #0
	adds r0, #0x34
	adds r2, r5, #0
	movs r5, #0x2c
	ldrsh r3, [r4, r5]
	lsls r3, r3, #5
	movs r5, #0x2a
	ldrsh r4, [r4, r5]
	adds r3, r3, r4
	lsls r3, r3, #1
	ldr r4, _08022854 @ =0x02022C60
	adds r3, r3, r4
	bl DrawItemMenuLine
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08022850: .4byte 0x03004690
_08022854: .4byte 0x02022C60
