	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080439D0
sub_080439D0: @ 0x080439D0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08043A10 @ =0x00001191
	bl DecodeMsg
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0
	bl Text_InsertDrawString
	movs r0, #1
	bl DecodeMsg
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x80
	movs r2, #0
	bl Text_InsertDrawString
	movs r0, #2
	bl DecodeMsg
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0xb0
	movs r2, #0
	bl Text_InsertDrawString
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08043A10: .4byte 0x00001191
