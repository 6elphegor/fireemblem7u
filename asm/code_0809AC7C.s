	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0809AC7C
sub_0809AC7C: @ 0x0809AC7C
	push {lr}
	sub sp, #4
	ldr r3, _0809AC98 @ =0x00000202
	movs r0, #0
	str r0, [sp]
	movs r0, #0x41
	movs r1, #0xd4
	movs r2, #0x52
	bl StartTalkFace
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_0809AC98: .4byte 0x00000202
