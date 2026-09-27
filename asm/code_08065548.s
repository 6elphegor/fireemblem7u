	.include "macro.inc"

	.syntax unified

	thumb_func_start NewEkrDragonBaseHide
NewEkrDragonBaseHide: @ 0x08065548
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08065568 @ =0x08BD93A0
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	adds r2, r0, #0
	adds r2, #0x29
	movs r1, #0
	strb r1, [r2]
	strh r1, [r0, #0x2c]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08065568: .4byte 0x08BD93A0
