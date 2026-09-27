	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0803DC28
sub_0803DC28: @ 0x0803DC28
	push {lr}
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r0, _0803DC7C @ =0x02022C60
	movs r1, #0
	bl TmFill
	ldr r0, _0803DC80 @ =0x02023460
	movs r1, #0
	bl TmFill
	ldr r0, _0803DC84 @ =0x02023C60
	movs r1, #0
	bl TmFill
	ldr r0, _0803DC88 @ =0x02024460
	movs r1, #0
	bl TmFill
	movs r0, #0xf
	bl EnableBgSync
	pop {r0}
	bx r0
	.align 2, 0
_0803DC7C: .4byte 0x02022C60
_0803DC80: .4byte 0x02023460
_0803DC84: .4byte 0x02023C60
_0803DC88: .4byte 0x02024460
