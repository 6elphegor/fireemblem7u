	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807A52C
sub_0807A52C: @ 0x0807A52C
	push {lr}
	adds r1, r0, #0
	adds r1, #0x64
	movs r2, #0
	strh r2, [r1]
	adds r0, #0x66
	strh r2, [r0]
	ldr r0, _0807A550 @ =0x08CA7554
	bl Proc_EndEach
	ldr r0, _0807A554 @ =0x0841E3B8
	movs r1, #0x90
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	pop {r0}
	bx r0
	.align 2, 0
_0807A550: .4byte 0x08CA7554
_0807A554: .4byte 0x0841E3B8
