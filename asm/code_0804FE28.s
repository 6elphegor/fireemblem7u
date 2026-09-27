	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0804FE28
sub_0804FE28: @ 0x0804FE28
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #1
	bne _0804FE5A
	movs r0, #0
	strh r0, [r4, #0x2c]
	str r0, [r4, #0x44]
	ldr r0, _0804FE60 @ =0x081D8434
	str r0, [r4, #0x48]
	ldr r0, _0804FE64 @ =0x08B9AFD4
	str r0, [r4, #0x4c]
	ldr r0, _0804FE68 @ =0x082C7ED0
	ldr r1, _0804FE6C @ =0x06008000
	bl LZ77UnCompVram
	ldr r0, _0804FE70 @ =0x082CD6C4
	ldr r1, _0804FE74 @ =0x02022920
	movs r2, #8
	bl CpuFastSet
	adds r0, r4, #0
	bl Proc_Break
_0804FE5A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804FE60: .4byte 0x081D8434
_0804FE64: .4byte 0x08B9AFD4
_0804FE68: .4byte 0x082C7ED0
_0804FE6C: .4byte 0x06008000
_0804FE70: .4byte 0x082CD6C4
_0804FE74: .4byte 0x02022920
