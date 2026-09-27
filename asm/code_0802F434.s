	.include "macro.inc"

	.syntax unified

	thumb_func_start ActionVisitAndSeize
ActionVisitAndSeize: @ 0x0802F434
	push {r4, r5, lr}
	ldr r5, _0802F45C @ =0x0203A85C
	ldrb r0, [r5, #0xc]
	bl GetUnit
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	ldrb r0, [r5, #0xc]
	bl GetUnit
	movs r1, #0x11
	ldrsb r1, [r0, r1]
	adds r0, r4, #0
	bl StartAvailableTileEvent
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0802F45C: .4byte 0x0203A85C
