	.include "macro.inc"

	.syntax unified

	thumb_func_start NewEkrDragonFlashingWingObj
NewEkrDragonFlashingWingObj: @ 0x08065A10
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08065A30 @ =0x08BD9468
	movs r1, #4
	bl Proc_Start
	adds r2, r0, #0
	adds r2, #0x29
	movs r1, #0
	strb r1, [r2]
	str r4, [r0, #0x5c]
	ldrb r1, [r4, #0x12]
	str r1, [r0, #0x54]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08065A30: .4byte 0x08BD9468
