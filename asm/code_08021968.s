	.include "macro.inc"

	.syntax unified

	thumb_func_start MakeUnitRescueTransferGraphics
MakeUnitRescueTransferGraphics: @ 0x08021968
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldrb r0, [r4, #0x1b]
	bl GetUnit
	adds r6, r0, #0
	bl EndSubtitleHelp
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
	adds r0, r6, #0
	bl Make6CKOIDOAMM
	pop {r4, r5, r6}
	pop {r0}
	bx r0
