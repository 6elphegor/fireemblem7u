	.include "macro.inc"

	.syntax unified

	thumb_func_start NewEkrDragonFxMain
NewEkrDragonFxMain: @ 0x08065EB8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08065EE0 @ =0x08BD9510
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	str r1, [r0, #0x44]
	str r1, [r0, #0x48]
	ldr r1, _08065EE4 @ =0x08BD9528
	str r1, [r0, #0x4c]
	movs r1, #0x80
	lsls r1, r1, #5
	str r1, [r0, #0x54]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08065EE0: .4byte 0x08BD9510
_08065EE4: .4byte 0x08BD9528
