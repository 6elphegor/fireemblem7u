	.include "macro.inc"

	.syntax unified

	thumb_func_start ArenaGenerateMatchupGoldValue
ArenaGenerateMatchupGoldValue: @ 0x0802F0AC
	ldr r2, _0802F0D0 @ =0x0203A7F4
	ldrh r1, [r2, #0x18]
	ldrh r3, [r2, #0x16]
	subs r0, r1, r3
	lsrs r1, r0, #0x1f
	adds r1, r0, r1
	asrs r1, r1, #1
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #1
	movs r1, #0xc8
	lsls r1, r1, #2
	adds r0, r0, r1
	cmp r0, #0
	bgt _0802F0CC
	movs r0, #1
_0802F0CC:
	strh r0, [r2, #8]
	bx lr
	.align 2, 0
_0802F0D0: .4byte 0x0203A7F4
