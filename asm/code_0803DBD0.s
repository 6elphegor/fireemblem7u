	.include "macro.inc"

	.syntax unified

	thumb_func_start ClearSioBG
ClearSioBG: @ 0x0803DBD0
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
	ldr r0, _0803DC1C @ =0x02022C60
	movs r1, #0
	bl TmFill
	ldr r0, _0803DC20 @ =0x02023460
	movs r1, #0
	bl TmFill
	ldr r0, _0803DC24 @ =0x02023C60
	movs r1, #0
	bl TmFill
	movs r0, #7
	bl EnableBgSync
	pop {r0}
	bx r0
	.align 2, 0
_0803DC1C: .4byte 0x02022C60
_0803DC20: .4byte 0x02023460
_0803DC24: .4byte 0x02023C60
