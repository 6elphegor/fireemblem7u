	.include "macro.inc"

	.syntax unified

	thumb_func_start NewEfxFlashBgDirectly
NewEfxFlashBgDirectly: @ 0x0804F090
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _0804F0AC @ =0x08B9AE4C
	movs r1, #0
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r5, [r0, #0x2e]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804F0AC: .4byte 0x08B9AE4C
