	.include "macro.inc"

	.syntax unified

	thumb_func_start CheckAnyBlueUnitArea4
CheckAnyBlueUnitArea4: @ 0x08078888
	push {lr}
	ldr r0, _080788A4 @ =0x0202BBF8
	ldrb r0, [r0, #0xf]
	cmp r0, #0x80
	bne _080788A8
	movs r0, #0x11
	movs r1, #0x15
	movs r2, #0x1f
	movs r3, #0x23
	bl CheckAnyBlueUnitArea
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	b _080788AA
	.align 2, 0
_080788A4: .4byte 0x0202BBF8
_080788A8:
	movs r0, #0
_080788AA:
	pop {r1}
	bx r1
	.align 2, 0
