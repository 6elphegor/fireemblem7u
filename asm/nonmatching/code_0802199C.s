	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0802199C
sub_0802199C: @ 0x0802199C
	push {r4, r5, lr}
	ldr r4, _080219E8 @ =0x0203A85C
	movs r0, #9
	strb r0, [r4, #0x11]
	ldrb r0, [r1, #2]
	strb r0, [r4, #0xd]
	ldrb r0, [r4, #0xd]
	bl GetUnit
	bl UnitSyncMovement
	ldrb r0, [r4, #0xd]
	bl GetUnit
	adds r5, r0, #0
	ldrb r0, [r4, #0xc]
	bl GetUnit
	adds r1, r0, #0
	adds r0, r5, #0
	bl MakeUnitRescueTransferGraphics
	ldrb r0, [r4, #0xd]
	bl GetUnit
	adds r5, r0, #0
	ldrb r0, [r4, #0xc]
	bl GetUnit
	adds r1, r0, #0
	adds r0, r5, #0
	bl UnitGive
	movs r0, #0x17
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080219E8: .4byte 0x0203A85C
