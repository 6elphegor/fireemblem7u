	.include "macro.inc"

	.syntax unified

	thumb_func_start NewEfxLvupBGCOL
NewEfxLvupBGCOL: @ 0x08069FCC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08069FF4 @ =0x08BDB814
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	movs r2, #0
	strh r2, [r0, #0x2c]
	strh r2, [r0, #0x2e]
	movs r1, #0x19
	strh r1, [r0, #0x30]
	str r2, [r0, #0x44]
	ldr r1, _08069FF8 @ =0x082E5C48
	str r1, [r0, #0x48]
	ldr r1, _08069FFC @ =0x081E56DC
	str r1, [r0, #0x4c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08069FF4: .4byte 0x08BDB814
_08069FF8: .4byte 0x082E5C48
_08069FFC: .4byte 0x081E56DC
