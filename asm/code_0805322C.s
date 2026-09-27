	.include "macro.inc"

	.syntax unified

	thumb_func_start GetBattleAnimCharacterUniquePalIndex
GetBattleAnimCharacterUniquePalIndex: @ 0x0805322C
	ldr r3, _0805324C @ =0x030014D8
	ldr r2, [r0]
	ldr r1, [r0, #4]
	ldr r0, [r2, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	lsrs r0, r0, #8
	movs r1, #1
	ands r0, r1
	adds r2, #0x23
	adds r2, r2, r0
	ldrb r0, [r2]
	strh r0, [r3]
	subs r0, #1
	bx lr
	.align 2, 0
_0805324C: .4byte 0x030014D8
