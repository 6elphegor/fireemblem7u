	.include "macro.inc"

	.syntax unified

	thumb_func_start CheckAnyBlueUnitArea7
CheckAnyBlueUnitArea7: @ 0x08078900
	push {lr}
	ldr r0, _0807891C @ =0x0202BBF8
	ldrb r0, [r0, #0xf]
	cmp r0, #0x80
	bne _08078920
	movs r0, #0x15
	movs r1, #0
	movs r2, #0x1e
	movs r3, #6
	bl CheckAnyBlueUnitArea
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	b _08078922
	.align 2, 0
_0807891C: .4byte 0x0202BBF8
_08078920:
	movs r0, #0
_08078922:
	pop {r1}
	bx r1
	.align 2, 0
