	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08044A8C
sub_08044A8C: @ 0x08044A8C
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	bl StartLinkArenaPointsBox
	ldr r0, _08044ABC @ =0x000012CB
	bl DecodeMsg
	adds r2, r0, #0
	str r4, [sp]
	movs r0, #0x58
	movs r1, #0x3c
	movs r3, #1
	bl sub_08044940
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08044AB4
	bl EndLinkArenaPointsBox
_08044AB4:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08044ABC: .4byte 0x000012CB
