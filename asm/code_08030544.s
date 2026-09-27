	.include "macro.inc"

	.syntax unified

	thumb_func_start PrepScreenProc_StartBrightenMap
PrepScreenProc_StartBrightenMap: @ 0x08030544
	push {lr}
	sub sp, #0x14
	movs r3, #0x80
	lsls r3, r3, #1
	str r3, [sp]
	str r3, [sp, #4]
	ldr r1, _0803056C @ =0xFF00FFF0
	str r1, [sp, #8]
	movs r1, #0x40
	str r1, [sp, #0xc]
	str r0, [sp, #0x10]
	movs r0, #0xc0
	movs r1, #0xc0
	movs r2, #0xc0
	bl sub_080139D8
	add sp, #0x14
	pop {r0}
	bx r0
	.align 2, 0
_0803056C: .4byte 0xFF00FFF0
