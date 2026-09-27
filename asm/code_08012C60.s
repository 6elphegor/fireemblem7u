	.include "macro.inc"

	.syntax unified

	thumb_func_start DecodeMsg
DecodeMsg: @ 0x08012C60
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r6, _08012C84 @ =0x0202B5B4
	ldr r0, [r6]
	cmp r5, r0
	beq _08012C90
	ldr r1, _08012C88 @ =0x08B808AC
	lsls r0, r5, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r4, _08012C8C @ =0x0202A5B4
	adds r1, r4, #0
	bl DecodeStringRam
	str r5, [r6]
	adds r0, r4, #0
	b _08012C92
	.align 2, 0
_08012C84: .4byte 0x0202B5B4
_08012C88: .4byte 0x08B808AC
_08012C8C: .4byte 0x0202A5B4
_08012C90:
	ldr r0, _08012C98 @ =0x0202A5B4
_08012C92:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08012C98: .4byte 0x0202A5B4
