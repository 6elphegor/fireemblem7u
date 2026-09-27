	.include "macro.inc"

	.syntax unified

	thumb_func_start HbPopulate_BkselWTriEffB
HbPopulate_BkselWTriEffB: @ 0x08034298
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080342C0 @ =0x08B96D5C
	bl Proc_Find
	ldr r1, _080342C4 @ =0x0203A470
	adds r1, #0x53
	movs r2, #0
	ldrsb r2, [r1, r2]
	adds r0, #0x53
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
_080342C0: .4byte 0x08B96D5C
_080342C4: .4byte 0x0203A470
