	.include "macro.inc"

	.syntax unified

	thumb_func_start CheckAnyBlueUnitArea6
CheckAnyBlueUnitArea6: @ 0x080788D8
	push {lr}
	ldr r0, _080788F4 @ =0x0202BBF8
	ldrb r0, [r0, #0xf]
	cmp r0, #0x80
	bne _080788F8
	movs r0, #0
	movs r1, #0x18
	movs r2, #0xc
	movs r3, #0x1b
	bl CheckAnyBlueUnitArea
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	b _080788FA
	.align 2, 0
_080788F4: .4byte 0x0202BBF8
_080788F8:
	movs r0, #0
_080788FA:
	pop {r1}
	bx r1
	.align 2, 0
