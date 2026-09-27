	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080084EC
sub_080084EC: @ 0x080084EC
	push {r4, r5, lr}
	ldr r0, _0800852C @ =0x08B909B8
	ldr r2, [r0]
	ldrb r1, [r2, #8]
	cmp r1, #1
	bne _08008534
	movs r4, #0
	ldrb r2, [r2, #0xa]
	cmp r4, r2
	bge _08008524
	adds r5, r0, #0
_08008502:
	ldr r1, [r5]
	ldrb r2, [r1, #0xb]
	adds r0, r2, r4
	ldrb r1, [r1, #0xa]
	bl __modsi3
	lsls r0, r0, #3
	ldr r1, _08008530 @ =0x030000C8
	adds r0, r0, r1
	movs r1, #4
	bl Text_SetColor
	adds r4, #1
	ldr r0, [r5]
	ldrb r0, [r0, #0xa]
	cmp r4, r0
	blt _08008502
_08008524:
	ldr r0, _0800852C @ =0x08B909B8
	ldr r1, [r0]
	movs r0, #4
	b _08008566
	.align 2, 0
_0800852C: .4byte 0x08B909B8
_08008530: .4byte 0x030000C8
_08008534:
	movs r4, #0
	ldrb r2, [r2, #0xa]
	cmp r4, r2
	bge _08008560
	adds r5, r0, #0
_0800853E:
	ldr r1, [r5]
	ldrb r2, [r1, #0xb]
	adds r0, r2, r4
	ldrb r1, [r1, #0xa]
	bl __modsi3
	lsls r0, r0, #3
	ldr r1, _08008570 @ =0x030000C8
	adds r0, r0, r1
	movs r1, #1
	bl Text_SetColor
	adds r4, #1
	ldr r0, [r5]
	ldrb r0, [r0, #0xa]
	cmp r4, r0
	blt _0800853E
_08008560:
	ldr r0, _08008574 @ =0x08B909B8
	ldr r1, [r0]
	movs r0, #1
_08008566:
	strb r0, [r1, #8]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08008570: .4byte 0x030000C8
_08008574: .4byte 0x08B909B8
