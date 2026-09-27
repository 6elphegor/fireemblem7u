	.include "macro.inc"

	.syntax unified

	thumb_func_start StaffCommandRange
StaffCommandRange: @ 0x080229F0
	push {r4, r5, r6, lr}
	ldr r5, _08022A2C @ =0x03004690
	ldr r0, [r5]
	movs r4, #1
	rsbs r4, r4, #0
	adds r1, r4, #0
	bl GetUnitItemUseReachBits
	adds r6, r0, #0
	ldr r0, _08022A30 @ =0x0202E3E4
	ldr r0, [r0]
	adds r1, r4, #0
	bl BmMapFillg
	ldr r0, _08022A34 @ =0x0202E3E8
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	ldr r0, [r5]
	adds r1, r6, #0
	bl BuildUnitStandingRangeForReach
	movs r0, #5
	bl DisplayMoveRangeGraphics
	movs r0, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08022A2C: .4byte 0x03004690
_08022A30: .4byte 0x0202E3E4
_08022A34: .4byte 0x0202E3E8
