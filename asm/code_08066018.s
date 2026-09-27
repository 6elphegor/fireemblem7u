	.include "macro.inc"

	.syntax unified

	thumb_func_start NewEkrDragonBodyBlack
NewEkrDragonBodyBlack: @ 0x08066018
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08066038 @ =0x08BD9530
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r2, #0
	movs r1, #0
	strh r1, [r0, #0x2c]
	adds r1, r0, #0
	adds r1, #0x29
	strb r2, [r1]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08066038: .4byte 0x08BD9530
