	.include "macro.inc"

	.syntax unified

	thumb_func_start PrepMapMenu_OnFormation
PrepMapMenu_OnFormation: @ 0x080303C8
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r0, #2
	str r0, [r5, #0x58]
	ldr r4, _080303FC @ =0x0202BBB8
	movs r1, #0x14
	ldrsh r0, [r4, r1]
	movs r2, #0x16
	ldrsh r1, [r4, r2]
	bl TrySwitchViewedUnit
	movs r1, #0x20
	ldrsh r0, [r4, r1]
	movs r2, #0x22
	ldrsh r1, [r4, r2]
	movs r2, #0
	bl PutMapCursor
	adds r0, r5, #0
	bl Proc_Break
	bl EndPrepScreenMenu_
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080303FC: .4byte 0x0202BBB8
