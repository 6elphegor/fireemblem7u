	.include "macro.inc"

	.syntax unified

	thumb_func_start NewEkrDragon
NewEkrDragon: @ 0x08064C10
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	bl GetEkrDragonStatus
	adds r6, r0, #0
	ldr r0, _08064C3C @ =0x08BD9318
	movs r1, #3
	bl Proc_Start
	adds r4, r0, #0
	str r4, [r6, #4]
	adds r0, r5, #0
	movs r1, #1
	bl AddEkrDragonStatusAttr
	str r5, [r6, #0xc]
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08064C3C: .4byte 0x08BD9318
