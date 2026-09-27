	.include "macro.inc"

	.syntax unified

	thumb_func_start ApplyStatusChange
ApplyStatusChange: @ 0x0802D258
	push {r4, lr}
	ldr r0, _0802D284 @ =0x0203A470
	adds r4, r0, #0
	adds r4, #0x6f
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #0
	blt _0802D27C
	ldr r0, _0802D288 @ =0x0203A85C
	ldrb r0, [r0, #0xd]
	bl GetUnit
	movs r1, #0
	ldrsb r1, [r4, r1]
	bl SetUnitStatus
	movs r0, #0xff
	strb r0, [r4]
_0802D27C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802D284: .4byte 0x0203A470
_0802D288: .4byte 0x0203A85C
