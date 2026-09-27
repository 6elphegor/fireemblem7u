	.include "macro.inc"

	.syntax unified

	thumb_func_start CheckAnyBlueUnitArea5
CheckAnyBlueUnitArea5: @ 0x080788B0
	push {lr}
	ldr r0, _080788CC @ =0x0202BBF8
	ldrb r0, [r0, #0xf]
	cmp r0, #0x80
	bne _080788D0
	movs r0, #0
	movs r1, #0xf
	movs r2, #8
	movs r3, #0x12
	bl CheckAnyBlueUnitArea
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	b _080788D2
	.align 2, 0
_080788CC: .4byte 0x0202BBF8
_080788D0:
	movs r0, #0
_080788D2:
	pop {r1}
	bx r1
	.align 2, 0
