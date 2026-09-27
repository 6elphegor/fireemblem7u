	.include "macro.inc"

	.syntax unified

	thumb_func_start GetItemName
GetItemName: @ 0x080171BC
	push {lr}
	movs r1, #0xff
	ands r0, r1
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _080171E0 @ =0x08BE222C
	adds r1, r1, r0
	ldrh r0, [r1]
	bl DecodeMsg
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl sub_08012F14
	pop {r1}
	bx r1
	.align 2, 0
_080171E0: .4byte 0x08BE222C
