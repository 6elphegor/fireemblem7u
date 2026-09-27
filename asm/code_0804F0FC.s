	.include "macro.inc"

	.syntax unified

	thumb_func_start NewEfxWhiteOUT
NewEfxWhiteOUT: @ 0x0804F0FC
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	ldr r0, _0804F11C @ =0x08B9AE74
	movs r1, #0
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r5, [r0, #0x2e]
	strh r6, [r0, #0x30]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804F11C: .4byte 0x08B9AE74
