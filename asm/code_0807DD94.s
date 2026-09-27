	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807DD94
sub_0807DD94: @ 0x0807DD94
	push {lr}
	sub sp, #4
	movs r0, #0
	str r0, [sp]
	movs r1, #0xc0
	lsls r1, r1, #0x13
	ldr r2, _0807DDC4 @ =0x01000008
	mov r0, sp
	bl CpuFastSet
	ldr r0, _0807DDC8 @ =0x02022C60
	movs r1, #0
	bl TmFill
	ldr r0, _0807DDCC @ =0x02023460
	movs r1, #0
	bl TmFill
	movs r0, #3
	bl EnableBgSync
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_0807DDC4: .4byte 0x01000008
_0807DDC8: .4byte 0x02022C60
_0807DDCC: .4byte 0x02023460
