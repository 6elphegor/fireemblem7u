	.include "macro.inc"

	.syntax unified

	thumb_func_start HbPopulate_BkselWTriEffA
HbPopulate_BkselWTriEffA: @ 0x08034268
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08034290 @ =0x08B96D5C
	bl Proc_Find
	ldr r1, _08034294 @ =0x0203A3F0
	adds r1, #0x53
	movs r2, #0
	ldrsb r2, [r1, r2]
	adds r0, #0x52
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r0, r2, #0
	bl GetBkselHelpBoxMsg
	adds r4, #0x4c
	strh r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08034290: .4byte 0x08B96D5C
_08034294: .4byte 0x0203A3F0
