	.include "macro.inc"

	.syntax unified

	thumb_func_start NewEfxStatusCHG
NewEfxStatusCHG: @ 0x0804DFD0
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r1, _0804DFF4 @ =0x02017728
	ldr r4, [r1]
	cmp r4, #0
	bne _0804DFEC
	movs r0, #1
	str r0, [r1]
	ldr r0, _0804DFF8 @ =0x08B9ACB4
	movs r1, #3
	bl Proc_Start
	strh r4, [r0, #0x2c]
	str r5, [r0, #0x64]
_0804DFEC:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804DFF4: .4byte 0x02017728
_0804DFF8: .4byte 0x08B9ACB4
