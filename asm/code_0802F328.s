	.include "macro.inc"

	.syntax unified

	thumb_func_start DoRescueAction
DoRescueAction: @ 0x0802F328
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r4, _0802F378 @ =0x0203A85C
	ldrb r0, [r4, #0xc]
	bl GetUnit
	adds r5, r0, #0
	ldrb r0, [r4, #0xd]
	bl GetUnit
	adds r4, r0, #0
	bl TryRemoveUnitFromBallista
	movs r0, #0x10
	ldrsb r0, [r5, r0]
	movs r1, #0x11
	ldrsb r1, [r5, r1]
	movs r2, #0x10
	ldrsb r2, [r4, r2]
	movs r3, #0x11
	ldrsb r3, [r4, r3]
	bl GetSomeFacingDirection
	adds r1, r0, #0
	adds r0, r4, #0
	movs r2, #0
	adds r3, r6, #0
	bl Make6CKOIDO
	adds r0, r5, #0
	adds r1, r4, #0
	bl UnitRescue
	adds r0, r4, #0
	bl HideUnitSprite
	movs r0, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0802F378: .4byte 0x0203A85C
