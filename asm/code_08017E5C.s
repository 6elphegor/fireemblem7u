	.include "macro.inc"

	.syntax unified

	thumb_func_start UnitGive
UnitGive: @ 0x08017E5C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	ldr r1, _08017E8C @ =0x08B92EB0
	ldrb r2, [r4, #0x1b]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r5, [r0]
	adds r0, r6, #0
	adds r1, r5, #0
	bl CanUnitRescue
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0
	bl UnitDrop
	adds r0, r6, #0
	adds r1, r5, #0
	bl UnitRescue
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08017E8C: .4byte 0x08B92EB0
