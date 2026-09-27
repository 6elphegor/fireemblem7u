	.include "macro.inc"

	.syntax unified

	thumb_func_start CheckAnyBlueUnitArea2
CheckAnyBlueUnitArea2: @ 0x08078820
	push {lr}
	ldr r0, _08078864 @ =0x0202BBF8
	ldrb r0, [r0, #0xf]
	cmp r0, #0x80
	bne _08078860
	movs r0, #0
	movs r1, #0x18
	movs r2, #0x10
	movs r3, #0x1b
	bl CheckAnyBlueUnitArea
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08078868
	movs r0, #0
	movs r1, #0x15
	movs r2, #2
	movs r3, #0x17
	bl CheckAnyBlueUnitArea
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08078868
	movs r0, #3
	movs r1, #0x14
	movs r2, #5
	movs r3, #0x16
	bl CheckAnyBlueUnitArea
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08078868
_08078860:
	movs r0, #0
	b _0807886A
	.align 2, 0
_08078864: .4byte 0x0202BBF8
_08078868:
	movs r0, #1
_0807886A:
	pop {r1}
	bx r1
	.align 2, 0
