	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08044AC0
sub_08044AC0: @ 0x08044AC0
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	bl StartLinkArenaPointsBox
	ldr r0, _08044AE8 @ =0x000012CB
	bl DecodeMsg
	adds r2, r0, #0
	str r4, [sp]
	movs r0, #0x58
	movs r1, #0x3c
	movs r3, #0
	bl sub_08044940
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08044AE8: .4byte 0x000012CB
