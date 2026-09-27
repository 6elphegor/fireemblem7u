	.include "macro.inc"

	.syntax unified

	thumb_func_start StartSubSpell_efxThunderstormDARK
StartSubSpell_efxThunderstormDARK: @ 0x08059320
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	ldr r1, _08059354 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08059358 @ =0x02022860
	ldr r1, _0805935C @ =0x020165C8
	movs r2, #0x80
	lsls r2, r2, #1
	bl CpuFastSet
	ldr r0, _08059360 @ =0x08BA1E14
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
_08059354: .4byte 0x0201774C
_08059358: .4byte 0x02022860
_0805935C: .4byte 0x020165C8
_08059360: .4byte 0x08BA1E14
