	.include "macro.inc"

	.syntax unified

	thumb_func_start GenerateExtendedMovementMap
GenerateExtendedMovementMap: @ 0x08019C80
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r0, r2, #0
	bl SetWorkingMoveTable
	ldr r0, _08019CA8 @ =0x0202E3E4
	ldr r1, [r0]
	ldr r0, _08019CAC @ =0x030041E0
	str r1, [r0]
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0x7c
	movs r3, #0
	bl BeginMapFlood
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08019CA8: .4byte 0x0202E3E4
_08019CAC: .4byte 0x030041E0
