	.include "macro.inc"

	.syntax unified

	thumb_func_start CheckAnyBlueUnitArea1
CheckAnyBlueUnitArea1: @ 0x080787F4
	push {lr}
	ldr r0, _08078814 @ =0x0202BBF8
	ldrb r0, [r0, #0xf]
	cmp r0, #0x80
	bne _08078818
	movs r0, #0
	movs r1, #0xf
	movs r2, #0x19
	movs r3, #0x17
	bl CheckAnyBlueUnitArea
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08078818
	movs r0, #1
	b _0807881A
	.align 2, 0
_08078814: .4byte 0x0202BBF8
_08078818:
	movs r0, #0
_0807881A:
	pop {r1}
	bx r1
	.align 2, 0
