	.include "macro.inc"

	.syntax unified

	thumb_func_start CheckEfxDragonDeadFallHead
CheckEfxDragonDeadFallHead: @ 0x08064C5C
	push {lr}
	bl GetEkrDragonStatusAttr
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0x80
	lsls r1, r1, #5
	ands r0, r1
	cmp r0, #0
	bne _08064C74
	movs r0, #0
	b _08064C76
_08064C74:
	movs r0, #1
_08064C76:
	pop {r1}
	bx r1
	.align 2, 0
