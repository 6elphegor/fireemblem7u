	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0801EDC0
sub_0801EDC0: @ 0x0801EDC0
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	ldr r0, _0801EDE8 @ =0x08198818
	movs r1, #0x90
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _0801EDEC @ =0x08B93814
	adds r1, r4, #0
	bl Proc_StartBlocking
	str r5, [r0, #0x2c]
	str r6, [r0, #0x30]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0801EDE8: .4byte 0x08198818
_0801EDEC: .4byte 0x08B93814
