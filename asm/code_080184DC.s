	.include "macro.inc"

	.syntax unified

	thumb_func_start UnitHasMagicRank
UnitHasMagicRank: @ 0x080184DC
	adds r2, r0, #0
	adds r0, #0x2c
	adds r1, r2, #0
	adds r1, #0x2d
	ldrb r1, [r1]
	ldrb r0, [r0]
	orrs r1, r0
	adds r0, r2, #0
	adds r0, #0x2e
	ldrb r0, [r0]
	orrs r1, r0
	adds r0, r2, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	orrs r1, r0
	rsbs r0, r1, #0
	orrs r0, r1
	lsrs r0, r0, #0x1f
	bx lr
	.align 2, 0
