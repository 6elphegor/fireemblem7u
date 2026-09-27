	.include "macro.inc"

	.syntax unified

	thumb_func_start BattlePrintDebugHitInfo
BattlePrintDebugHitInfo: @ 0x0802A494
	ldr r1, _0802A4B0 @ =0x0203A4F0
	movs r0, #0x80
	ldrb r2, [r1, #2]
	ands r0, r2
	cmp r0, #0
	bne _0802A4AE
	movs r2, #0x80
_0802A4A2:
	adds r1, #4
	adds r0, r2, #0
	ldrb r3, [r1, #2]
	ands r0, r3
	cmp r0, #0
	beq _0802A4A2
_0802A4AE:
	bx lr
	.align 2, 0
_0802A4B0: .4byte 0x0203A4F0
