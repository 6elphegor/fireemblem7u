	.include "macro.inc"

	.syntax unified

	thumb_func_start PopupIconUpdateProc_Loop
PopupIconUpdateProc_Loop: @ 0x0800AB1C
	push {r4, lr}
	ldr r4, [r0, #0x2c]
	ldr r1, [r0, #0x30]
	ldr r2, _0800AB34 @ =0x08B905B8
	adds r0, #0x4a
	ldrh r3, [r0]
	adds r0, r4, #0
	bl PutOamHiRam
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800AB34: .4byte 0x08B905B8
