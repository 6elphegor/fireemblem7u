	.include "macro.inc"

	.syntax unified

	thumb_func_start ResetPathArrow
ResetPathArrow: @ 0x0802FE4C
	push {lr}
	movs r0, #1
	bl CutOffPathLength
	bl GenerateMovementMapForActiveUnit
	ldr r1, _0802FE70 @ =0x0202BBB8
	movs r2, #0x14
	ldrsh r0, [r1, r2]
	movs r2, #0x16
	ldrsh r1, [r1, r2]
	ldr r2, _0802FE74 @ =0x02033E00
	bl BuildBestMoveScript
	bl GetPathFromMovementScript
	pop {r0}
	bx r0
	.align 2, 0
_0802FE70: .4byte 0x0202BBB8
_0802FE74: .4byte 0x02033E00
