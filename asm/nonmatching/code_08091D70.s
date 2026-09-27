	.include "macro.inc"

	.syntax unified

	thumb_func_start PrepItemScreen_StartStatScreen
PrepItemScreen_StartStatScreen: @ 0x08091D70
	push {r4, lr}
	adds r4, r0, #0
	bl PrepItemScreen_OnEnd
	movs r0, #0x31
	bl SetStatScreenExcludedUnitFlags
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r0, [r0]
	bl GetUnitFromPrepList
	adds r1, r4, #0
	bl StartStatScreen
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
