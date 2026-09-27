	.include "macro.inc"

	.syntax unified

	thumb_func_start GetPlayerLeaderUnitId
GetPlayerLeaderUnitId: @ 0x0803031C
	ldr r0, _08030330 @ =0x0202BBF8
	ldrb r0, [r0, #0x1b]
	cmp r0, #2
	beq _0803033E
	cmp r0, #2
	bgt _08030334
	cmp r0, #1
	beq _0803033A
	b _08030346
	.align 2, 0
_08030330: .4byte 0x0202BBF8
_08030334:
	cmp r0, #3
	beq _08030342
	b _08030346
_0803033A:
	movs r0, #3
	b _08030348
_0803033E:
	movs r0, #1
	b _08030348
_08030342:
	movs r0, #2
	b _08030348
_08030346:
	movs r0, #0
_08030348:
	bx lr
	.align 2, 0
